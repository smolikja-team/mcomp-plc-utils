import 'package:json_annotation/json_annotation.dart';

part 'plc_real_bo.g.dart';

@JsonSerializable()
class PlcRealBO {
  PlcRealBO({required this.value});

  factory PlcRealBO.fromJson(Map<String, dynamic> json) =>
      _$PlcRealBOFromJson(json);

  final String dt = 'REAL';

  @JsonKey(name: 'val')
  double value;

  Map<String, dynamic> toJson() => _$PlcRealBOToJson(this);
}
