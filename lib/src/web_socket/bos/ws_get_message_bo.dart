// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ws_get_message_bo.freezed.dart';
part 'ws_get_message_bo.g.dart';

@freezed
abstract class WsGetMessageBO with _$WsGetMessageBO {
  const factory WsGetMessageBO({
    @Default('get') String intent,
    required List<String> payload,
  }) = _WsGetMessageBO;

  factory WsGetMessageBO.fromJson(Map<String, dynamic> json) =>
      _$WsGetMessageBOFromJson(json);
}
