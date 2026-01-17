import 'package:mcomp_plc_utils/src/config_fetcher/models/cached_plc_config.dart';
import 'package:mcomp_plc_utils/src/config_fetcher/models/user_plc_identifiers.dart';

/// Abstract interface for configuration cache storage.
///
/// Implementations provide persistent storage for PLC configurations
/// and user identifiers, enabling offline-first functionality.
///
/// The default implementation is `FileConfigCacheStorage` which uses
/// the device's application support directory.
abstract class ConfigCacheStorage {
  /// Retrieves a cached PLC configuration for the specified user and PLC.
  ///
  /// Returns `null` if no cached configuration exists.
  Future<CachedPlcConfig?> getPlcConfig({
    required String userId,
    required String plcId,
  });

  /// Saves a PLC configuration to the cache.
  ///
  /// Overwrites any existing cache entry for the same user and PLC.
  Future<void> savePlcConfig(CachedPlcConfig config);

  /// Retrieves cached PLC identifiers for the specified user.
  ///
  /// Returns `null` if no cached identifiers exist.
  Future<UserPlcIdentifiers?> getUserIdentifiers(String userId);

  /// Saves user PLC identifiers to the cache.
  ///
  /// Overwrites any existing cached identifiers for the user.
  Future<void> saveUserIdentifiers(UserPlcIdentifiers identifiers);

  /// Clears all cached data for the specified user.
  ///
  /// Should be called when a user logs out to ensure data isolation.
  Future<void> clearUserCache(String userId);

  /// Clears the entire cache for all users.
  ///
  /// Use with caution - this removes all cached configurations.
  Future<void> clearAll();
}
