import 'package:dio/dio.dart';
import 'package:fuzik_app/data/storage.dart';
import 'package:fuzik_app/models/entity/user.dart';
import 'package:fuzik_app/models/json.dart';
import 'package:fuzik_app/repositories/base.dart';

class UserRepository {
  /// POST /user/sign_up_group_admin
  Future<JSON> signUpGroupAdmin(JSON request) async {
    try {
      final uri = Uri.https(baseURL, 'user/sign_up_group_admin');
      final response = await dio.postUri(uri, data: request);
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

  /// POST /user/confirm_payment
  Future<JSON> confirmPayment(JSON query) async {
    try {
      final uri = Uri.https(baseURL, 'user/confirm_payment', query);
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

  /// POST /buy_ticket
  Future<JSON> buyTicket(JSON query) async {
    try {
      final uri = Uri.https(baseURL, 'user/buy_ticket', query);
      final response = await dio.postUri(uri);
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

  /// GET /user/info
  Future<User> getUserInfo() async {
    try {
      final uri = Uri.https(baseURL, 'user/info');
      final response = await dio.getUri(uri);
      final result =  User.fromJson(response.data);
      storage.setString('user_email', result.email);
      // When response status code is 200
      return result;
    } on DioException catch (e) {
      // Error by bad request
      if (e.response?.statusCode == 401) {
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

  /// PATCH /user/info
  Future<JSON> editUserInfo(JSON request) async {
    try {
      final uri = Uri.https(baseURL, 'user/info');
      final response = await dio.patchUri(uri, data: request);
      // When response status code is 200
      return response.data;
    } on DioException catch (e) {
      // Error by bad request
      if (e.response?.statusCode == 401) {
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

  /// PUT /user/password
  Future<JSON> changePassword(String password) async {
    try {
      final uri = Uri.https(baseURL, 'user/info', {'new_password': password});
      final response = await dio.putUri(uri);
      // When response status code is 200
      return response.data;
    } on DioException catch (e) {
      // Error by bad request
      if (e.response?.statusCode == 401) {
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
