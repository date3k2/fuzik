import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fuzik_app/models/response/token.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences storage;

void saveToken(Token token) async {
  if (token.accessToken != null) await storage.setString('access_token', token.accessToken!);
  if (token.accessToken != null) await storage.setString('token_type', token.tokenType!);
}
