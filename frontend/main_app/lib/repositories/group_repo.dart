import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fuzik_app/models/entity/group.dart';
import 'package:fuzik_app/models/entity/models.dart';
import 'package:fuzik_app/models/entity/user.dart';
import 'package:fuzik_app/models/json.dart';
import 'package:fuzik_app/repositories/base.dart';

class GroupRepository {
  /// POST /group"
  Future<JSON> createGroup(JSON data) async {
    try {
      final uri = Uri.https(baseURL, 'group');
      final response = await dio.postUri(uri, data: data);
      // When response status code is 200
      return response.data;
    } on DioException catch (e) {
      // Error by bad request
      if (e.response?.statusCode == 400) {
        throw e.response?.data["detail"];
      }
      // Error by unauthorized
      if (e.response?.statusCode == 401) {
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

  /// POST /group/user"
  Future<JSON> addUserToGroup(String email, int groupId) async {
    try {
      final uri = Uri.https(baseURL, 'group/user', {'group_id': groupId, 'email': email});
      final response = await dio.postUri(uri);
      // When response status code is 200
      return response.data;
    } on DioException catch (e) {
      // Error by bad request
      if (e.response?.statusCode == 400) {
        throw e.response?.data["detail"];
      }
      // Error by unauthorized
      if (e.response?.statusCode == 401) {
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

  /// DELETE /group
  Future<JSON> deleteUserToGroup(String email, int groupId) async {
    try {
      final uri = Uri.https(baseURL, 'group', {'group_id': groupId, 'email': email});
      final response = await dio.deleteUri(uri);
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

  /// GET /group
  Future<List<Group>> getAllUserGroup() async {
    try {
      final uri = Uri.https(baseURL, 'group');
      final response = await dio.getUri(uri);
      // When response status code is 200
      return (response.data as List).map((e) => Group.fromJson(e)).toList();
    } on DioException catch (e) {
      // Error by unauthorized
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

  /// POST /group
  Future<JSON> changeGroupInfo(Group data) async {
    try {
      final uri = Uri.https(baseURL, 'group');
      final response = await dio.postUri(uri, data: data);
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
