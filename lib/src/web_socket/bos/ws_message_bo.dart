import 'package:json_annotation/json_annotation.dart';
import 'package:mcomp_plc_utils/src/web_socket/bos/ws_message_item_bo.dart';

part 'ws_message_bo.g.dart';

@JsonSerializable()
class WsMessageBO {
  WsMessageBO({
    required this.items,
    required this.differences,
  });

  factory WsMessageBO.fromJson(Map<String, dynamic> json) =>
      _$WsMessageBOFromJson(json);

  @JsonKey(name: 'list')
  final List<WsMessageItemBO>? items;

  @JsonKey(name: 'diff')
  final List<WsMessageItemBO>? differences;
}
