// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ws_set_message_payload_bo.freezed.dart';
part 'ws_set_message_payload_bo.g.dart';

@freezed
abstract class WsSetMessagePayloadBO with _$WsSetMessagePayloadBO {
  const factory WsSetMessagePayloadBO({
    required String id,
    @JsonKey(name: 'props') required Map<String, dynamic> update,
  }) = _WsSetMessagePayloadBO;

  factory WsSetMessagePayloadBO.fromJson(Map<String, dynamic> json) =>
      _$WsSetMessagePayloadBOFromJson(json);
}
