import 'package:dio/dio.dart';
import 'package:fuzik_app/models/json.dart';
import 'package:fuzik_app/repositories/base.dart';

class AuthRepository {
  /// POST /login
  Future<JSON> login(JSON authRequest) async {
    try {
      final uri = Uri.https(baseURL, 'login');
      final response = await dio.postUri(uri, data: authRequest);
      // When response status code is 200
      return response.data;
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

  /// POST /reset_password
  Future<JSON> resetPassword(JSON request) async {
    try {
      final uri = Uri.https(baseURL, 'signup');
      final response = await dio.postUri(uri, data: request);
      // When response status code is 200
      return response.data;
    } on DioException catch (e) {
      // Error by bad request
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