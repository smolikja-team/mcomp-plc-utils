// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plc_int_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlcIntBO _$PlcIntBOFromJson(Map<String, dynamic> json) => PlcIntBO(
      value: (json['val'] as num).toInt(),
      dt: json['dt'] as String? ?? 'USINT',
    );

Map<String, dynamic> _$PlcIntBOToJson(PlcIntBO instance) => <String, dynamic>{
      'dt': instance.dt,
      'val': instance.value,
    };
