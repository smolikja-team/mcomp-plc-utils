import 'package:freezed_annotation/freezed_annotation.dart';

part 'cache_metadata.freezed.dart';
part 'cache_metadata.g.dart';

/// Metadata for cached configuration used to validate cache freshness.
///
/// Contains the MD5 hash from Firebase Storage metadata for efficient
/// change detection without downloading the entire file.
@freezed
abstract class CacheMetadata with _$CacheMetadata {
  /// Creates cache metadata.
  const factory CacheMetadata({
    /// MD5 hash of the config file from Firebase Storage.
    ///
    /// Used to detect changes without downloading the entire file.
    required String md5Hash,

    /// User ID who owns this cache entry.
    required String userId,

    /// Timestamp when the cache was created.
    required DateTime cachedAt,
  }) = _CacheMetadata;

  /// Creates [CacheMetadata] from JSON map.
  factory CacheMetadata.fromJson(Map<String, dynamic> json) =>
      _$CacheMetadataFromJson(json);
}
