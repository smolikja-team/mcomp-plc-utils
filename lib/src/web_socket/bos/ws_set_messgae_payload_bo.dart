import 'package:json_annotation/json_annotation.dart';

part 'ws_set_messgae_payload_bo.g.dart';

@JsonSerializable()
class WsSetMessgaePayloadBO {
  WsSetMessgaePayloadBO({required this.id, required this.update});

  factory WsSetMessgaePayloadBO.fromJson(Map<String, dynamic> json) =>
      _$WsSetMessgaePayloadBOFromJson(json);

  String id;

  @JsonKey(name: 'props')
  Map<String, dynamic> update;

  Map<String, dynamic> toJson() => _$WsSetMessgaePayloadBOToJson(this);
}
