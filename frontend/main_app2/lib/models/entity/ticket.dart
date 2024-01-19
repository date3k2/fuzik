import 'package:json_annotation/json_annotation.dart';

part 'ticket.g.dart';

@JsonSerializable()
class Ticket
{
  final int? id;
  final String name;
  final num price;
  final DateTime createdAt;
  final int concertId;

  Ticket({this.id, required this.name, required this.price, required this.concertId, required this.createdAt});
  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
  Map<String, dynamic> toJson() => _$TicketToJson(this);
}