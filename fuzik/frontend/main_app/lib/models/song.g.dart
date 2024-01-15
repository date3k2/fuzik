// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Song _$SongFromJson(Map<String, dynamic> json) => Song(
      name: json['name'] as String,
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lyric: json['lyric'] as String?,
      link: json['link'] as String,
      userId: json['userId'] as String,
      albumId: json['albumId'] as String?,
    );

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'lyric': instance.lyric,
      'link': instance.link,
      'userId': instance.userId,
      'albumId': instance.albumId,
    };
