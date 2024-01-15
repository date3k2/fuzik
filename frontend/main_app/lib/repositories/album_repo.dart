import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fuzik_app/models/entity/album.dart';
import 'package:fuzik_app/models/entity/models.dart';
import 'package:fuzik_app/models/entity/user.dart';
import 'package:fuzik_app/models/json.dart';
import 'package:fuzik_app/repositories/base.dart';

class AlbumRepository {
  /// POST /album"
  Future<JSON> uploadAlbum(JSON data) async {
    try {
      final uri = Uri.https(baseURL, 'album');
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

  /// DELETE /album
  Future<JSON> deleteAlbum(Album album) async {
    try {
      final uri = Uri.https(baseURL, 'album', {'album_id': album.id});
      final response = await dio.deleteUri(uri, data: album);
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

  /// GET /album
  Future<List<Album>> getAllAlbum() async {
    try {
      final uri = Uri.https(baseURL, 'album');
      final response = await dio.getUri(uri);
      // When response status code is 200
      return (response.data as List).map((e) => Album.fromJson(e)).toList();
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

  /// GET /album/?album={$id}
  Future<Album> getAlbumDetail(dynamic id) async {
    try {
      final uri = Uri.https(baseURL, 'album', {'album': id});
      final response = await dio.getUri(uri);
      // When response status code is 200
      return Album.fromJson(response.data);
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

  /// PATCH /album
  Future<JSON> modifyAlbum(Album data) async {
    try {
      final uri = Uri.https(baseURL, 'album');
      final response = await dio.patchUri(uri, data: data);
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
