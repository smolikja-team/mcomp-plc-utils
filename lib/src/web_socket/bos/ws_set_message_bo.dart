// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mcomp_plc_utils/src/web_socket/bos/ws_set_message_payload_bo.dart';

part 'ws_set_message_bo.freezed.dart';
part 'ws_set_message_bo.g.dart';

@freezed
abstract class WsSetMessageBO with _$WsSetMessageBO {
  const factory WsSetMessageBO({
    @Default('set') String intent,
    required List<WsSetMessagePayloadBO> payload,
  }) = _WsSetMessageBO;

  factory WsSetMessageBO.fromJson(Map<String, dynamic> json) =>
      _$WsSetMessageBOFromJson(json);
}
