// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plc_bool_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlcBoolBO _$PlcBoolBOFromJson(Map<String, dynamic> json) => PlcBoolBO(
      value: json['val'] as bool,
      dt: json['dt'] as String? ?? 'BOOL',
    );

Map<String, dynamic> _$PlcBoolBOToJson(PlcBoolBO instance) => <String, dynamic>{
      'dt': instance.dt,
      'val': instance.value,
    };
