// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_get_message_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WsGetMessageBO _$WsGetMessageBOFromJson(Map<String, dynamic> json) =>
    WsGetMessageBO(
      payload:
          (json['payload'] as List<dynamic>).map((e) => e as String).toList(),
    )..intent = json['intent'] as String;

Map<String, dynamic> _$WsGetMessageBOToJson(WsGetMessageBO instance) =>
    <String, dynamic>{
      'intent': instance.intent,
      'payload': instance.payload,
    };
