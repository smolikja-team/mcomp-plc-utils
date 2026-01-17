import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mcomp_plc_utils/src/config_fetcher/models/cache_metadata.dart';

part 'cached_plc_config.freezed.dart';
part 'cached_plc_config.g.dart';

/// Cached PLC configuration with associated metadata.
///
/// Wraps the raw config data with caching metadata for validation
/// and cache management purposes.
@freezed
abstract class CachedPlcConfig with _$CachedPlcConfig {
  /// Creates a cached PLC configuration.
  const factory CachedPlcConfig({
    /// PLC identifier matching the Firebase Storage file name.
    required String plcId,

    /// The actual configuration data.
    required Map<String, dynamic> config,

    /// Cache metadata for validation.
    required CacheMetadata metadata,
  }) = _CachedPlcConfig;

  /// Creates [CachedPlcConfig] from JSON map.
  factory CachedPlcConfig.fromJson(Map<String, dynamic> json) =>
      _$CachedPlcConfigFromJson(json);
}
