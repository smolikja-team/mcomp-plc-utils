import 'package:json_annotation/json_annotation.dart';

part 'ws_message_item_bo.g.dart';

@JsonSerializable()
class WsMessageItemBO {
  WsMessageItemBO({
    required this.id,
    required this.value,
  });

  factory WsMessageItemBO.fromJson(Map<String, dynamic> json) =>
      _$WsMessageItemBOFromJson(json);

  final String id;

  @JsonKey(name: 'props')
  final Map<String, dynamic> value;
}
