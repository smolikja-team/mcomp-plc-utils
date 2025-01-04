import 'package:json_annotation/json_annotation.dart';

part 'plc_dt_bo.g.dart';

@JsonSerializable()
class PlcDtBO {
  PlcDtBO({required this.value});

  factory PlcDtBO.fromJson(Map<String, dynamic> json) =>
      _$PlcDtBOFromJson(json);

  final String dt = 'DT';

  @JsonKey(name: 'val')
  final double value;

  Map<String, dynamic> toJson() => _$PlcDtBOToJson(this);
}
