// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_set_message_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WsSetMessageBO _$WsSetMessageBOFromJson(Map<String, dynamic> json) =>
    _WsSetMessageBO(
      intent: json['intent'] as String? ?? 'set',
      payload: (json['payload'] as List<dynamic>)
          .map((e) => WsSetMessagePayloadBO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WsSetMessageBOToJson(_WsSetMessageBO instance) =>
    <String, dynamic>{
      'intent': instance.intent,
      'payload': instance.payload,
    };
