// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) => Song(
      id: json['id'] as int?,
      name: json['name'] as String,
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      lyric: json['lyric'] as String?,
      link: json['name_in_storage'] as String,
      userId: json['user_id'] as String,
      albumId: json['albumId'] as int?,
    );

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'created_at': instance.createdAt.toIso8601String(),
      'lyric': instance.lyric,
      'name_in_storage': instance.link,
      'user_id': instance.userId,
      'albumId': instance.albumId,
    };
