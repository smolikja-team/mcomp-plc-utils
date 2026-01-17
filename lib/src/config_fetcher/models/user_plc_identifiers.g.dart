// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_plc_identifiers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserPlcIdentifiers _$UserPlcIdentifiersFromJson(Map<String, dynamic> json) =>
    _UserPlcIdentifiers(
      userId: json['userId'] as String,
      identifiers: (json['identifiers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      cachedAt: DateTime.parse(json['cachedAt'] as String),
    );

Map<String, dynamic> _$UserPlcIdentifiersToJson(_UserPlcIdentifiers instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'identifiers': instance.identifiers,
      'cachedAt': instance.cachedAt.toIso8601String(),
    };
