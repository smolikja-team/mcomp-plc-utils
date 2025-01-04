import 'package:json_annotation/json_annotation.dart';

part 'plc_dt_bo.g.dart';

@JsonSerializable()
class PlcDtBO {
  PlcDtBO({
    required this.value,
    this.dt = 'DT',
  });

  factory PlcDtBO.fromJson(Map<String, dynamic> json) =>
      _$PlcDtBOFromJson(json);

  @JsonKey()
  final String dt;

  @JsonKey(name: 'val')
  final double value;

  Map<String, dynamic> toJson() => _$PlcDtBOToJson(this);
}
