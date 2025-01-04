import 'package:json_annotation/json_annotation.dart';

part 'plc_bool_bo.g.dart';

@JsonSerializable()
class PlcBoolBO {
  PlcBoolBO({required this.value});

  factory PlcBoolBO.fromJson(Map<String, dynamic> json) =>
      _$PlcBoolBOFromJson(json);

  final String dt = 'BOOL';

  @JsonKey(name: 'val')
  final bool value;

  Map<String, dynamic> toJson() => _$PlcBoolBOToJson(this);
}
