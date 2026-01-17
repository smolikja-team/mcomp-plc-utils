// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plc_real_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlcRealBO _$PlcRealBOFromJson(Map<String, dynamic> json) => _PlcRealBO(
      value: (json['val'] as num).toDouble(),
      dt: json['dt'] as String? ?? 'REAL',
    );

Map<String, dynamic> _$PlcRealBOToJson(_PlcRealBO instance) =>
    <String, dynamic>{
      'val': instance.value,
      'dt': instance.dt,
    };
