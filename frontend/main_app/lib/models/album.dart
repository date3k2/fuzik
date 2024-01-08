import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable()

class Album {
    final int? id;
    String? name;
    final DateTime createdAt;
    final String userId;
    Album({required this.id, this.name, required this.createdAt,required this.userId});
    factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
    Map<String, dynamic> toJson() => _$AlbumToJson(this);
}