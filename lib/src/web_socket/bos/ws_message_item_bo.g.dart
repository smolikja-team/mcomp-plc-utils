// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ws_message_item_bo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WsMessageItemBO _$WsMessageItemBOFromJson(Map<String, dynamic> json) =>
    WsMessageItemBO(
      id: json['id'] as String,
      value: json['props'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$WsMessageItemBOToJson(WsMessageItemBO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'props': instance.value,
    };
