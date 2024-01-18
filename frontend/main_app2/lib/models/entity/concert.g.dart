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
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      startAt: json['start_at'] == null
          ? null
          : DateTime.parse(json['start_at'] as String),
      groupId: json['group_id'] as int?,
      numberOfTickets: json['number_of_tickets'] as int?,
    );

Map<String, dynamic> _$ConcertToJson(Concert instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'description': instance.description,
      'created_at': instance.createdAt?.toIso8601String(),
      'start_at': instance.startAt?.toIso8601String(),
      'group_id': instance.groupId,
      'number_of_tickets': instance.numberOfTickets,
    };
