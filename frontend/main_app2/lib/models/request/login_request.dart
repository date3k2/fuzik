import 'package:fuzik_app/models/json.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  String? username;
  String? password;

  LoginRequest({this.username, this.password});

  factory LoginRequest.fromJson(JSON json) => _$LoginRequestFromJson(json);
  JSON toJson() => _$LoginRequestToJson(this);
}