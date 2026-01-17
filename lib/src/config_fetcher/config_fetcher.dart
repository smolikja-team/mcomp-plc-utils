import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logging/logging.dart';
import 'package:mcomp_plc_utils/src/config_fetcher/models/cache_metadata.dart';
import 'package:mcomp_plc_utils/src/config_fetcher/models/cached_plc_config.dart';
import 'package:mcomp_plc_utils/src/config_fetcher/models/user_plc_identifiers.dart';
import 'package:mcomp_plc_utils/src/config_fetcher/storage/config_cache_storage.dart';
import 'package:mcomp_plc_utils/src/config_fetcher/storage/file_config_cache_storage.dart';

/// Fetches PLC configurations from Firebase Storage with offline caching.
///
/// Implements a **cache-first with network validation** strategy:
/// 1. Try to fetch from Firebase with graceful fallback to cache
/// 2. Use MD5 hash to detect changes without downloading entire file
/// 3. Cache valid responses for offline use
///
/// Each user has isolated cache storage for security.
///
/// Example usage:
/// ```dart
/// // Normal fetch with caching
/// final configs = await ConfigFetcher.fetchUsersPlcs();
///
/// // Force refresh from Firebase (bypass cache)
/// final freshConfigs = await ConfigFetcher.fetchUsersPlcs(forceRefresh: true);
/// ```
class ConfigFetcher {
  static const String _kConfigFileExtension = '.json';
  static const String _kFirestoreCollection = 'plcs';
  static const String _kFirestoreKeyUsers = 'users';
  static const String _kFirestoreKeyEmail = 'email';
  static const String _kFirestoreKeyUid = 'uid';
  static const int _kOneMegabyte = 1024 * 1024;

  /// Timeout for Firebase operations.
  static const Duration _kFirebaseTimeout = Duration(seconds: 10);

  static final _log = Logger('ConfigFetcher');

  /// Fetches user's PLC configurations from Firebase Storage with caching.
  ///
  /// Uses a **cache-first with network validation** approach:
  /// - Tries to fetch from Firebase first
  /// - Falls back to cached data on any network error
  /// - Uses MD5 hash comparison to avoid unnecessary downloads
  ///
  /// Parameters:
  /// - [forceRefresh]: When `true`, bypasses MD5 check and downloads directly.
  ///   Default is `false`.
  /// - [cacheStorage]: Custom cache storage implementation.
  ///   Defaults to [FileConfigCacheStorage].
  ///
  /// Returns a list of PLC configurations as [Map<String, dynamic>].
  ///
  /// Throws [Exception] if the current user is null or has no email.
  static Future<List<Map<String, dynamic>>> fetchUsersPlcs({
    bool forceRefresh = false,
    ConfigCacheStorage? cacheStorage,
  }) async {
    final storage = cacheStorage ?? const FileConfigCacheStorage();
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null || currentUser.email == null) {
      throw Exception('fetchUsersPlcs: current user is null');
    }

    final userId = currentUser.uid;
    final userEmail = currentUser.email!;

    final identifiers = await _fetchIdentifiersWithFallback(
      storage: storage,
      userId: userId,
      userEmail: userEmail,
    );

    if (identifiers == null || identifiers.isEmpty) {
      _log.warning('No PLC identifiers available');
      return [];
    }

    return _fetchConfigsForIdentifiers(
      storage: storage,
      userId: userId,
      identifiers: identifiers,
      forceRefresh: forceRefresh,
    );
  }

  /// Fetches identifiers from Firestore with fallback to cache.
  static Future<List<String>?> _fetchIdentifiersWithFallback({
    required ConfigCacheStorage storage,
    required String userId,
    required String userEmail,
  }) async {
    try {
      final identifiers = await _fetchPlcsIdentifiers(
        userEmail: userEmail,
        userUid: userId,
      ).timeout(_kFirebaseTimeout);

      if (identifiers != null && identifiers.isNotEmpty) {
        await storage.saveUserIdentifiers(
          UserPlcIdentifiers(
            userId: userId,
            identifiers: identifiers,
            cachedAt: DateTime.now(),
          ),
        );
        return identifiers;
      }

      return null;
    } on TimeoutException {
      _log.warning('Firestore timeout - using cached identifiers');
    } catch (e) {
      _log.warning('Firestore error: $e - using cached identifiers');
    }

    return _loadCachedIdentifiers(storage, userId);
  }

  /// Loads cached identifiers for offline use.
  static Future<List<String>?> _loadCachedIdentifiers(
    ConfigCacheStorage storage,
    String userId,
  ) async {
    final cached = await storage.getUserIdentifiers(userId);
    return cached?.identifiers;
  }

  /// Fetches configurations for all identifiers.
  static Future<List<Map<String, dynamic>>> _fetchConfigsForIdentifiers({
    required ConfigCacheStorage storage,
    required String userId,
    required List<String> identifiers,
    required bool forceRefresh,
  }) async {
    final configs = <Map<String, dynamic>>[];
    final storageRef = FirebaseStorage.instance.ref();

    for (final plcId in identifiers) {
      final config = await _fetchSingleConfig(
        storageRef: storageRef,
        storage: storage,
        userId: userId,
        plcId: plcId,
        forceRefresh: forceRefresh,
      );

      if (config != null) {
        configs.add(config);
      }
    }

    return configs;
  }

  /// Fetches a single PLC config with cache-first logic.
  static Future<Map<String, dynamic>?> _fetchSingleConfig({
    required Reference storageRef,
    required ConfigCacheStorage storage,
    required String userId,
    required String plcId,
    required bool forceRefresh,
  }) async {
    final pathReference = storageRef.child(plcId + _kConfigFileExtension);

    // Try to get metadata from Firebase for MD5 comparison
    String? remoteMd5Hash;
    try {
      final metadata =
          await pathReference.getMetadata().timeout(_kFirebaseTimeout);
      remoteMd5Hash = metadata.md5Hash;
    } on TimeoutException {
      _log.warning('Metadata timeout for $plcId');
    } catch (e) {
      _log.warning('Metadata error for $plcId: $e');
    }

    // Check local cache
    final cachedConfig = await storage.getPlcConfig(
      userId: userId,
      plcId: plcId,
    );

    // If we couldn't reach Firebase, return cached version
    if (remoteMd5Hash == null) {
      if (cachedConfig != null) {
        return cachedConfig.config;
      }
      _log.warning('No cache available for $plcId and network failed');
      return null;
    }

    // If not forcing refresh and cache is valid, use it
    if (!forceRefresh && cachedConfig != null) {
      if (cachedConfig.metadata.md5Hash == remoteMd5Hash) {
        return cachedConfig.config;
      }
    }

    // Download fresh config
    return _downloadConfig(
      pathReference: pathReference,
      storage: storage,
      userId: userId,
      plcId: plcId,
      md5Hash: remoteMd5Hash,
      fallbackCache: cachedConfig,
    );
  }

  /// Downloads config from Firebase with fallback to cache on error.
  static Future<Map<String, dynamic>?> _downloadConfig({
    required Reference pathReference,
    required ConfigCacheStorage storage,
    required String userId,
    required String plcId,
    required String md5Hash,
    CachedPlcConfig? fallbackCache,
  }) async {
    try {
      final data =
          await pathReference.getData(_kOneMegabyte).timeout(_kFirebaseTimeout);

      if (data == null || data.isEmpty) {
        _log.warning('Empty data received for $plcId');
        return fallbackCache?.config;
      }

      final dataString = utf8.decode(data);
      final config = jsonDecode(dataString) as Map<String, dynamic>;

      // Save to cache
      await storage.savePlcConfig(
        CachedPlcConfig(
          plcId: plcId,
          config: config,
          metadata: CacheMetadata(
            md5Hash: md5Hash,
            userId: userId,
            cachedAt: DateTime.now(),
          ),
        ),
      );

      return config;
    } on TimeoutException {
      _log.warning('Download timeout for $plcId');
    } catch (e) {
      _log.warning('Download error for $plcId: $e');
    }

    return fallbackCache?.config;
  }

  /// Fetches PLC identifiers from Firestore.
  static Future<List<String>?> _fetchPlcsIdentifiers({
    required String userEmail,
    required String userUid,
  }) async {
    final documents = await FirebaseFirestore.instance
        .collection(_kFirestoreCollection)
        .where(
      _kFirestoreKeyUsers,
      arrayContains: {
        _kFirestoreKeyEmail: userEmail,
        _kFirestoreKeyUid: userUid,
      },
    ).get();

    final plcIds = documents.docs.map((doc) => doc.id).toList();
    return plcIds.isEmpty ? null : plcIds;
  }
}
