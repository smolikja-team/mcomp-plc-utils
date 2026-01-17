// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_get_message_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WsGetMessageBO _$WsGetMessageBOFromJson(Map<String, dynamic> json) =>
    _WsGetMessageBO(
      intent: json['intent'] as String? ?? 'get',
      payload:
          (json['payload'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$WsGetMessageBOToJson(_WsGetMessageBO instance) =>
    <String, dynamic>{
      'intent': instance.intent,
      'payload': instance.payload,
    };
