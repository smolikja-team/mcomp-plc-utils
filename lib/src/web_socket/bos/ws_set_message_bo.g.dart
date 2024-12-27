// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_set_message_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WsSetMessageBO _$WsSetMessageBOFromJson(Map<String, dynamic> json) =>
    WsSetMessageBO(
      payload: (json['payload'] as List<dynamic>)
          .map((e) => WsSetMessgaePayloadBO.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..intent = json['intent'] as String;

Map<String, dynamic> _$WsSetMessageBOToJson(WsSetMessageBO instance) =>
    <String, dynamic>{
      'intent': instance.intent,
      'payload': instance.payload.map((e) => e.toJson()).toList(),
    };
