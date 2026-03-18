// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plc_string_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlcStringBO _$PlcStringBOFromJson(Map<String, dynamic> json) => _PlcStringBO(
  value: (json['val'] as num).toDouble(),
  dt: json['dt'] as String? ?? 'STRING',
);

Map<String, dynamic> _$PlcStringBOToJson(_PlcStringBO instance) =>
    <String, dynamic>{'val': instance.value, 'dt': instance.dt};
