// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_message_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WsMessageBO _$WsMessageBOFromJson(Map<String, dynamic> json) => WsMessageBO(
      items: (json['list'] as List<dynamic>?)
          ?.map((e) => WsMessageItemBO.fromJson(e as Map<String, dynamic>))
          .toList(),
      differences: (json['diff'] as List<dynamic>?)
          ?.map((e) => WsMessageItemBO.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestedItems: (json['get'] as List<dynamic>?)
          ?.map((e) => WsMessageItemBO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WsMessageBOToJson(WsMessageBO instance) =>
    <String, dynamic>{
      'list': instance.items,
      'diff': instance.differences,
      'get': instance.requestedItems,
    };
