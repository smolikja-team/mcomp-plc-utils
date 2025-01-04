// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plc_tod_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlcTodBO _$PlcTodBOFromJson(Map<String, dynamic> json) => PlcTodBO(
      value: (json['val'] as num).toDouble(),
      dt: json['dt'] as String? ?? 'TOD',
    );

Map<String, dynamic> _$PlcTodBOToJson(PlcTodBO instance) => <String, dynamic>{
      'dt': instance.dt,
      'val': instance.value,
    };
