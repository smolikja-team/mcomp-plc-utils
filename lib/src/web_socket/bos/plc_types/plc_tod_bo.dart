// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'plc_tod_bo.freezed.dart';
part 'plc_tod_bo.g.dart';

@freezed
abstract class PlcTodBO with _$PlcTodBO {
  const factory PlcTodBO({
    @JsonKey(name: 'val') required double value,
    @Default('TOD') String dt,
  }) = _PlcTodBO;

  factory PlcTodBO.fromJson(Map<String, dynamic> json) =>
      _$PlcTodBOFromJson(json);
}
