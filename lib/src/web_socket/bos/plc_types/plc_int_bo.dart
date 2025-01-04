import 'package:json_annotation/json_annotation.dart';

part 'plc_int_bo.g.dart';

@JsonSerializable()
class PlcIntBO {
  PlcIntBO({
    required this.value,
    this.dt = 'USINT',
  });

  factory PlcIntBO.fromJson(Map<String, dynamic> json) =>
      _$PlcIntBOFromJson(json);

  @JsonKey()
  final String dt;

  @JsonKey(name: 'val')
  final int value;

  Map<String, dynamic> toJson() => _$PlcIntBOToJson(this);
}
