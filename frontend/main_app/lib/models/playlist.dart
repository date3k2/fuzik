import 'package:json_annotation/json_annotation.dart';

part 'playlist.g.dart';

@JsonSerializable()

class Playlist {
  final int? id;
  String? name;
  final DateTime createdAt;
  final String userId;
  List<int>? songId;
  Playlist({required this.id, this.name, required this.createdAt, required this.userId, this.songId});
  factory Playlist.fromJson(Map<String, dynamic> json) => _$PlaylistFromJson(json);
  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}