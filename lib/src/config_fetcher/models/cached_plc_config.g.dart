// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_plc_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CachedPlcConfig _$CachedPlcConfigFromJson(Map<String, dynamic> json) =>
    _CachedPlcConfig(
      plcId: json['plcId'] as String,
      config: json['config'] as Map<String, dynamic>,
      metadata: CacheMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$CachedPlcConfigToJson(_CachedPlcConfig instance) =>
    <String, dynamic>{
      'plcId': instance.plcId,
      'config': instance.config,
      'metadata': instance.metadata,
    };
