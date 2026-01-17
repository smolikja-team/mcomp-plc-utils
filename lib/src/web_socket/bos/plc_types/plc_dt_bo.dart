// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'plc_dt_bo.freezed.dart';
part 'plc_dt_bo.g.dart';

@freezed
abstract class PlcDtBO with _$PlcDtBO {
  const factory PlcDtBO({
    @JsonKey(name: 'val') required double value,
    @Default('DT') String dt,
  }) = _PlcDtBO;

  factory PlcDtBO.fromJson(Map<String, dynamic> json) =>
      _$PlcDtBOFromJson(json);
}
