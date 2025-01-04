// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plc_dt_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlcDtBO _$PlcDtBOFromJson(Map<String, dynamic> json) => PlcDtBO(
      value: (json['val'] as num).toDouble(),
      dt: json['dt'] as String? ?? 'DT',
    );

Map<String, dynamic> _$PlcDtBOToJson(PlcDtBO instance) => <String, dynamic>{
      'dt': instance.dt,
      'val': instance.value,
    };
