import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable()

class Album {
    final int? id;
    String? name;
    String? description;
    @JsonKey(name: 'created_at')
    final DateTime createdAt;
    @JsonKey(name: 'user_id')
    final String userId;
    Album({required this.id, this.description, this.name, required this.createdAt,required this.userId});
    factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
    Map<String, dynamic> toJson() => _$AlbumToJson(this);
}