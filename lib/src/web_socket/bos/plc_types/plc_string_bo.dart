// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'plc_string_bo.freezed.dart';
part 'plc_string_bo.g.dart';

@freezed
abstract class PlcStringBO with _$PlcStringBO {
  const factory PlcStringBO({
    @JsonKey(name: 'val') required double value,
    @Default('STRING') String dt,
  }) = _PlcStringBO;

  factory PlcStringBO.fromJson(Map<String, dynamic> json) =>
      _$PlcStringBOFromJson(json);
}
