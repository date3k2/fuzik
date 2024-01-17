import 'package:dio/dio.dart';
import 'package:fuzik_app/models/json.dart';
import 'package:fuzik_app/models/response/token.dart';
import 'package:fuzik_app/repositories/base.dart';

class AuthRepository {
  /// POST /login
  Future<Token> login(JSON authRequest) async {
    try {
      final uri = Uri.https(baseURL, 'login');
      final response = await dio.postUri(uri, data: authRequest, options: Options(contentType: "application/x-www-form-urlencoded"));
      // When response status code is 200
      return Token.fromJson(response.data);
    } on DioException catch (e) {
      // Error by bad request
      if (e.response?.statusCode == 400) {
        throw e.response?.data["detail"];
      }
      // Other errors
      else {
        throw "Unhandled error";
      }
    }
    catch (e) {
      // Error by request validation
      rethrow;
    }
  }

  /// POST /signUp
  Future<JSON> signUp(JSON request) async {
    try {
      final uri = Uri.https(baseURL, 'signup');
      final response = await dio.postUri(uri, data: request);
      // When response status code is 2xx
      return response.data;
    } on DioException catch (e) {
      // Error by bad request
      if (e.response?.statusCode == 400) {
        throw e.response?.data['detail'];
      }
      // Other errors
      else {
        throw "Unhandled error";
      }
    }
    catch (e) {
      // Error by request validation
      rethrow;
    }
  }

  /// POST /reset_password
  Future<JSON> resetPassword(String email) async {
    try {
      final uri = Uri.https(baseURL, 'reset_password', {'email': email});
      final response = await dio.postUri(uri);
      // When response status code is 200
      return response.data;
    } on DioException catch (e) {
      // Error by not found
      if (e.response?.statusCode == 404) {
        throw e.response?.data['detail'];
      }
      // Other errors
      else {
        throw "Unhandled error";
      }
    }
    catch (e) {
      // Error by request validation
      rethrow;
    }
  }

  /// POST /reset_password_confirm
  Future<JSON> resetPasswordConfirm(JSON query) async {
    try {
      final uri = Uri.https(baseURL, 'signup', query);
      final response = await dio.postUri(uri);
      // When response status code is 200
      return response.data;
    } on DioException catch (e) {
      // Error by bad request
      if (e.response?.statusCode == 400) {
        throw e.response?.data['detail'];
      }
      // Other errors
      else {
        throw "Unhandled error";
      }
    }
    catch (e) {
      // Error by request validation
      rethrow;
    }
  }

}