import 'package:json_annotation/json_annotation.dart';

part 'song.g.dart';

@JsonSerializable()
class Song
{
  final int? id;
  final String name;
  final String? description;
  @JsonKey(name:"created_at")
  final DateTime createdAt;
  final String? lyric;
  @JsonKey(name:"name_in_storage")
  final String link;
  @JsonKey(name:"user_id")
  final String userId;
  final int? albumId;
  @JsonKey(includeFromJson: false)
  String? author;

  Song({this.id, required this.name, this.description, required this.createdAt, this.lyric, required this.link, required this.userId, this.albumId});

  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);

  Map<String, dynamic> toJson() => _$SongToJson(this);
}