import 'package:json_annotation/json_annotation.dart';
import 'package:mcomp_plc_utils/src/web_socket/bos/ws_set_messgae_payload_bo.dart';

part 'ws_set_message_bo.g.dart';

@JsonSerializable(explicitToJson: true)
class WsSetMessageBO {
  WsSetMessageBO({required this.payload});

  factory WsSetMessageBO.fromJson(Map<String, dynamic> json) =>
      _$WsSetMessageBOFromJson(json);

  String intent = 'set';
  List<WsSetMessgaePayloadBO> payload;

  Map<String, dynamic> toJson() => _$WsSetMessageBOToJson(this);
}
