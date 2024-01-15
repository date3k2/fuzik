import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fuzik_app/models/entity/concert.dart';
import 'package:fuzik_app/models/entity/models.dart';
import 'package:fuzik_app/models/entity/user.dart';
import 'package:fuzik_app/models/json.dart';
import 'package:fuzik_app/repositories/base.dart';

class ConcertRepository {
  /// POST /concert"
  Future<JSON> createConcert(JSON data) async {
    try {
      final uri = Uri.https(baseURL, 'concert');
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

  /// DELETE /concert
  Future<JSON> deleteConcert(Concert concert) async {
    try {
      final uri = Uri.https(baseURL, 'concert', {'concert_id': concert.id});
      final response = await dio.deleteUri(uri, data: concert);
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

  /// GET /concert
  Future<List<Concert>> getAllConcert() async {
    try {
      final uri = Uri.https(baseURL, 'concert/get_all');
      final response = await dio.getUri(uri);
      // When response status code is 200
      return (response.data as List).map((e) => Concert.fromJson(e)).toList();
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

  /// GET /concert/get_group_concert
  Future<List<Concert>> getUserGroupConcert() async {
    try {
      final uri = Uri.https(baseURL, 'concert/get_group_concert');
      final response = await dio.getUri(uri);
      // When response status code is 200
      return (response.data as List).map((e) => Concert.fromJson(e)).toList();
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

  /// PUT /concert
  Future<JSON> modifyConcert(Concert data) async {
    try {
      final uri = Uri.https(baseURL, 'concert');
      final response = await dio.putUri(uri, data: data);
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
