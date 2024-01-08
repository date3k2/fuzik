import 'package:json_annotation/json_annotation.dart';

import 'gender.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String name;
  final String email;
  final DateTime? birthDate;
  final String? phoneNumber;
  final Gender gender;

  User({required this.name, required this.email, this.birthDate, this.phoneNumber, required this.gender});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}