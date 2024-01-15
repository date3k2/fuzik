import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fuzik_app/models/entity/models.dart';
import 'package:fuzik_app/models/entity/user.dart';
import 'package:fuzik_app/models/json.dart';
import 'package:fuzik_app/repositories/base.dart';

class SongRepository {
  /// POST /song"
  Future<JSON> uploadSong(JSON query, MultipartFile song) async {
    try {
      final uri = Uri.https(baseURL, 'song');
      final response = await dio.postUri(uri, data: File, options: Options(
        contentType: 'audio/mpeg'
      ));
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

  /// DELETE /song
  Future<JSON> deleteSong(JSON song) async {
    try {
      final uri = Uri.https(baseURL, 'song');
      final response = await dio.deleteUri(uri, data: song);
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

  /// GET /song/link
  Future<String> getLinkOfSong(String name) async {
    try {
      final uri = Uri.https(baseURL, 'song/link', {'name_in_storage': name});
      final response = await dio.getUri(uri);
      // When response status code is 200
      return response.data;
    } on DioException catch (e) {
      // Error by bad request
      if (e.response?.statusCode == 400) {
        throw e.response?.data['detail'];
      }

      else if (e.response?.statusCode == 401) {
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

  /// GET /song/search
  Future<List<Song>> searchSongByQuery(String query) async {
    try {
      final uri = Uri.https(baseURL, 'song/search', {'query': query});
      final response = await dio.getUri(uri);
      // When response status code is 200
      return List.of(response.data).map((e) => Song.fromJson(e)).toList();
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

  /// PATCH /song/info
  Future<JSON> editSongInfo(JSON request) async {
    try {
      final uri = Uri.https(baseURL, 'song/info');
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
}
