import 'package:json_annotation/json_annotation.dart';

part 'ws_get_message_bo.g.dart';

@JsonSerializable(explicitToJson: true)
class WsGetMessageBO {
  WsGetMessageBO({required this.payload});

  factory WsGetMessageBO.fromJson(Map<String, dynamic> json) =>
      _$WsGetMessageBOFromJson(json);

  String intent = 'get';
  List<String> payload;

  Map<String, dynamic> toJson() => _$WsGetMessageBOToJson(this);
}
