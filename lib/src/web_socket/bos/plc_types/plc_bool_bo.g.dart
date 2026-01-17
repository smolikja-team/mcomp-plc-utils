// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plc_bool_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlcBoolBO _$PlcBoolBOFromJson(Map<String, dynamic> json) => _PlcBoolBO(
      value: json['val'] as bool,
      dt: json['dt'] as String? ?? 'BOOL',
    );

Map<String, dynamic> _$PlcBoolBOToJson(_PlcBoolBO instance) =>
    <String, dynamic>{
      'val': instance.value,
      'dt': instance.dt,
    };
