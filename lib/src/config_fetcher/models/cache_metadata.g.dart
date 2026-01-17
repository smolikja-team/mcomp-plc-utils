// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CacheMetadata _$CacheMetadataFromJson(Map<String, dynamic> json) =>
    _CacheMetadata(
      md5Hash: json['md5Hash'] as String,
      userId: json['userId'] as String,
      cachedAt: DateTime.parse(json['cachedAt'] as String),
    );

Map<String, dynamic> _$CacheMetadataToJson(_CacheMetadata instance) =>
    <String, dynamic>{
      'md5Hash': instance.md5Hash,
      'userId': instance.userId,
      'cachedAt': instance.cachedAt.toIso8601String(),
    };
