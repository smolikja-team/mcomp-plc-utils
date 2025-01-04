import 'package:json_annotation/json_annotation.dart';

part 'plc_tod_bo.g.dart';

@JsonSerializable()
class PlcTodBO {
  PlcTodBO({required this.value}) : dt = 'TOD';

  factory PlcTodBO.fromJson(Map<String, dynamic> json) =>
      _$PlcTodBOFromJson(json);

  final String dt;

  @JsonKey(name: 'val')
  final double value;

  Map<String, dynamic> toJson() => _$PlcTodBOToJson(this);
}
