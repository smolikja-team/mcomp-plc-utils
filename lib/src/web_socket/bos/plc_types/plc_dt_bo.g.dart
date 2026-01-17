// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plc_dt_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlcDtBO _$PlcDtBOFromJson(Map<String, dynamic> json) => _PlcDtBO(
  value: (json['val'] as num).toDouble(),
  dt: json['dt'] as String? ?? 'DT',
);

Map<String, dynamic> _$PlcDtBOToJson(_PlcDtBO instance) => <String, dynamic>{
  'val': instance.value,
  'dt': instance.dt,
};
