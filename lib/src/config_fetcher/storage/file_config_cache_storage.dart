import 'dart:convert';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:mcomp_plc_utils/src/config_fetcher/models/cached_plc_config.dart';
import 'package:mcomp_plc_utils/src/config_fetcher/models/user_plc_identifiers.dart';
import 'package:mcomp_plc_utils/src/config_fetcher/storage/config_cache_storage.dart';
import 'package:path_provider/path_provider.dart';

/// File-based implementation of [ConfigCacheStorage].
///
/// Uses [getApplicationSupportDirectory] for persistent, non-user-visible
/// storage that is not automatically backed up to iCloud.
///
/// Directory structure:
/// ```
/// <app_support>/plc_config_cache/
///   <user_id>/
///     identifiers.json
///     <plc_id>/
///       config.json
/// ```
class FileConfigCacheStorage implements ConfigCacheStorage {
  /// Creates a file-based cache storage.
  const FileConfigCacheStorage();

  static const String _cacheDirectoryName = 'plc_config_cache';
  static const String _configFileName = 'config.json';
  static const String _identifiersFileName = 'identifiers.json';

  static final _log = Logger('FileConfigCacheStorage');

  /// Gets the base cache directory.
  Future<Directory> _getCacheDirectory() async {
    final appSupportDir = await getApplicationSupportDirectory();
    return Directory('${appSupportDir.path}/$_cacheDirectoryName');
  }

  /// Gets the user-specific cache directory.
  ///
  /// Sanitizes the userId to create a valid directory name.
  Future<Directory> _getUserDirectory(String userId) async {
    final cacheDir = await _getCacheDirectory();
    final sanitizedId = _sanitizeFileName(userId);
    return Directory('${cacheDir.path}/$sanitizedId');
  }

  /// Gets the PLC-specific cache directory.
  Future<Directory> _getPlcDirectory(String userId, String plcId) async {
    final userDir = await _getUserDirectory(userId);
    final sanitizedPlcId = _sanitizeFileName(plcId);
    return Directory('${userDir.path}/$sanitizedPlcId');
  }

  /// Sanitizes a string for use as a file/directory name.
  String _sanitizeFileName(String name) {
    return name.replaceAll(RegExp(r'[^\w\-]'), '_');
  }

  @override
  Future<CachedPlcConfig?> getPlcConfig({
    required String userId,
    required String plcId,
  }) async {
    try {
      final plcDir = await _getPlcDirectory(userId, plcId);
      final configFile = File('${plcDir.path}/$_configFileName');

      if (!await configFile.exists()) {
        _log.fine('No cached config for PLC: $plcId');
        return null;
      }

      final content = await configFile.readAsString();
      final json = jsonDecode(content) as Map<String, dynamic>;
      _log.fine('Loaded cached config for PLC: $plcId');
      return CachedPlcConfig.fromJson(json);
    } catch (e, stackTrace) {
      _log.warning('Failed to read cached config: $e', e, stackTrace);
      return null;
    }
  }

  @override
  Future<void> savePlcConfig(CachedPlcConfig config) async {
    try {
      final plcDir = await _getPlcDirectory(
        config.metadata.userId,
        config.plcId,
      );
      await plcDir.create(recursive: true);

      final configFile = File('${plcDir.path}/$_configFileName');
      final content = jsonEncode(config.toJson());
      await configFile.writeAsString(content);

      _log.fine('Saved config for PLC: ${config.plcId}');
    } catch (e, stackTrace) {
      _log.warning('Failed to save config: $e', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<UserPlcIdentifiers?> getUserIdentifiers(String userId) async {
    try {
      final userDir = await _getUserDirectory(userId);
      final identifiersFile = File('${userDir.path}/$_identifiersFileName');

      if (!await identifiersFile.exists()) {
        _log.fine('No cached identifiers for user: $userId');
        return null;
      }

      final content = await identifiersFile.readAsString();
      final json = jsonDecode(content) as Map<String, dynamic>;
      _log.fine('Loaded cached identifiers for user: $userId');
      return UserPlcIdentifiers.fromJson(json);
    } catch (e, stackTrace) {
      _log.warning('Failed to read cached identifiers: $e', e, stackTrace);
      return null;
    }
  }

  @override
  Future<void> saveUserIdentifiers(UserPlcIdentifiers identifiers) async {
    try {
      final userDir = await _getUserDirectory(identifiers.userId);
      await userDir.create(recursive: true);

      final identifiersFile = File('${userDir.path}/$_identifiersFileName');
      final content = jsonEncode(identifiers.toJson());
      await identifiersFile.writeAsString(content);

      _log.fine('Saved identifiers for user: ${identifiers.userId}');
    } catch (e, stackTrace) {
      _log.warning('Failed to save identifiers: $e', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> clearUserCache(String userId) async {
    try {
      final userDir = await _getUserDirectory(userId);
      if (await userDir.exists()) {
        await userDir.delete(recursive: true);
        _log.info('Cleared cache for user: $userId');
      }
    } catch (e, stackTrace) {
      _log.warning('Failed to clear user cache: $e', e, stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> clearAll() async {
    try {
      final cacheDir = await _getCacheDirectory();
      if (await cacheDir.exists()) {
        await cacheDir.delete(recursive: true);
        _log.info('Cleared entire cache');
      }
    } catch (e, stackTrace) {
      _log.warning('Failed to clear all cache: $e', e, stackTrace);
      rethrow;
    }
  }
}
