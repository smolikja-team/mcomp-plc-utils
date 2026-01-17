// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'plc_real_bo.freezed.dart';
part 'plc_real_bo.g.dart';

@freezed
abstract class PlcRealBO with _$PlcRealBO {
  const factory PlcRealBO({
    @JsonKey(name: 'val') required double value,
    @Default('REAL') String dt,
  }) = _PlcRealBO;

  factory PlcRealBO.fromJson(Map<String, dynamic> json) =>
      _$PlcRealBOFromJson(json);
}
