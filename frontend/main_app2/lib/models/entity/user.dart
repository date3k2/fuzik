import 'package:json_annotation/json_annotation.dart';

import 'gender.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String name;
  final String email;
  final DateTime? birthDate;
  final String? phoneNumber;
  @JsonKey(fromJson: _genderFromJson, toJson: _genderToJson)
  final Gender gender;

  User({required this.name, required this.email, this.birthDate, this.phoneNumber, required this.gender});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  static Gender _genderFromJson(int number) => Gender.values[number];
  static int _genderToJson(Gender gender) => Gender.values.indexOf(gender);
}