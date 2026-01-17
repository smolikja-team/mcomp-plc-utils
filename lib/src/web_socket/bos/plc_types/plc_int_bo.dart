// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'plc_int_bo.freezed.dart';
part 'plc_int_bo.g.dart';

@freezed
abstract class PlcIntBO with _$PlcIntBO {
  const factory PlcIntBO({
    @JsonKey(name: 'val') required int value,
    @Default('USINT') String dt,
  }) = _PlcIntBO;

  factory PlcIntBO.fromJson(Map<String, dynamic> json) =>
      _$PlcIntBOFromJson(json);
}
