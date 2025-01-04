// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plc_real_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlcRealBO _$PlcRealBOFromJson(Map<String, dynamic> json) => PlcRealBO(
      value: (json['val'] as num).toDouble(),
      dt: json['dt'] as String? ?? 'REAL',
    );

Map<String, dynamic> _$PlcRealBOToJson(PlcRealBO instance) => <String, dynamic>{
      'dt': instance.dt,
      'val': instance.value,
    };
