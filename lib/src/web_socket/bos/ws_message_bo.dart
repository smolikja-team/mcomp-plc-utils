// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mcomp_plc_utils/src/web_socket/bos/ws_message_item_bo.dart';

part 'ws_message_bo.freezed.dart';
part 'ws_message_bo.g.dart';

@freezed
abstract class WsMessageBO with _$WsMessageBO {
  const factory WsMessageBO({
    @JsonKey(name: 'list') List<WsMessageItemBO>? items,
    @JsonKey(name: 'diff') List<WsMessageItemBO>? differences,
    @JsonKey(name: 'get') List<WsMessageItemBO>? requestedItems,
  }) = _WsMessageBO;

  factory WsMessageBO.fromJson(Map<String, dynamic> json) =>
      _$WsMessageBOFromJson(json);
}
