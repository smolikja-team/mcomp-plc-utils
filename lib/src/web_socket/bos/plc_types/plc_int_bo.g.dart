// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plc_int_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlcIntBO _$PlcIntBOFromJson(Map<String, dynamic> json) => _PlcIntBO(
  value: (json['val'] as num).toInt(),
  dt: json['dt'] as String? ?? 'USINT',
);

Map<String, dynamic> _$PlcIntBOToJson(_PlcIntBO instance) => <String, dynamic>{
  'val': instance.value,
  'dt': instance.dt,
};
