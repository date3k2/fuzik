import 'package:json_annotation/json_annotation.dart';

part 'concert.g.dart';

@JsonSerializable()

class Concert
{
  int? id;
  final String? name;
  final String? location;
  final String? description;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'start_at')
  final DateTime? startAt;
  @JsonKey(name: 'group_id')
  final int? groupId;
  @JsonKey(name: 'number_of_tickets')
  final int? numberOfTickets;
  Concert({this.id, this.name, this.location, this.description, this.createdAt, this.startAt, this.groupId, this.numberOfTickets});
  factory Concert.fromJson(Map<String, dynamic> json) => _$ConcertFromJson(json);
  Map<String, dynamic> toJson() => _$ConcertToJson(this);
}