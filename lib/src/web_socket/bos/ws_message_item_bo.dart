// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ws_message_item_bo.freezed.dart';
part 'ws_message_item_bo.g.dart';

@freezed
abstract class WsMessageItemBO with _$WsMessageItemBO {
  const factory WsMessageItemBO({
    required String id,
    @JsonKey(name: 'props') required Map<String, dynamic> value,
  }) = _WsMessageItemBO;

  factory WsMessageItemBO.fromJson(Map<String, dynamic> json) =>
      _$WsMessageItemBOFromJson(json);
}
