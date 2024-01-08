import 'package:json_annotation/json_annotation.dart';

part 'concert.g.dart';

@JsonSerializable()

class Concert
{
  int? id;
  final String? name;
  final String? location;
  final String? description;
  final DateTime createdAt;
  final DateTime startAt;
  final int groupId;
  Concert({required this.id, required this.name, this.location,required this.description, required this.createdAt, required this.startAt, required this.groupId});
  factory Concert.fromJson(Map<String, dynamic> json) => _$ConcertFromJson(json);
  Map<String, dynamic> toJson() => _$ConcertToJson(this);
}