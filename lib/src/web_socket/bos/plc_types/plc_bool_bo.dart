// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'plc_bool_bo.freezed.dart';
part 'plc_bool_bo.g.dart';

@freezed
abstract class PlcBoolBO with _$PlcBoolBO {
  const factory PlcBoolBO({
    @JsonKey(name: 'val') required bool value,
    @Default('BOOL') String dt,
  }) = _PlcBoolBO;

  factory PlcBoolBO.fromJson(Map<String, dynamic> json) =>
      _$PlcBoolBOFromJson(json);
}
