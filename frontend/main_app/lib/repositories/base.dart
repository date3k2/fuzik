import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final baseURL = dotenv.env["BASE_URL"] ?? '';

///Dio cho việc kết nối với API
var dio = Dio(BaseOptions(
    contentType: 'application/json',
    connectTimeout: const Duration(seconds: 10),
    sendTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    receiveDataWhenStatusError: true));

///Thêm token vào header
void addAuth(String? token) {
  dio = Dio(BaseOptions(
      contentType: 'application/json',
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {"Authorization": "Bearer $token"}));
}
