// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Concert _$ConcertFromJson(Map<String, dynamic> json) => Concert(
      id: json['id'] as int?,
      name: json['name'] as String?,
      location: json['location'] as String?,
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      startAt: DateTime.parse(json['startAt'] as String),
      groupId: json['groupId'] as int,
    );

Map<String, dynamic> _$ConcertToJson(Concert instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'startAt': instance.startAt.toIso8601String(),
      'groupId': instance.groupId,
    };
