// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plc_tod_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlcTodBO _$PlcTodBOFromJson(Map<String, dynamic> json) => _PlcTodBO(
      value: (json['val'] as num).toDouble(),
      dt: json['dt'] as String? ?? 'TOD',
    );

Map<String, dynamic> _$PlcTodBOToJson(_PlcTodBO instance) => <String, dynamic>{
      'val': instance.value,
      'dt': instance.dt,
    };
