
import 'package:dio/dio.dart';
import 'package:fuzik_app/models/entity/playlist.dart';
import 'package:fuzik_app/models/json.dart';
import 'package:fuzik_app/repositories/base.dart';

class PlaylistRepository {
  /// POST /playlist"
  Future<JSON> createPlaylist(JSON data) async {
    try {
      final uri = Uri.https(baseURL, 'playlist');
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

  /// DELETE /playlist
  Future<JSON> deletePlaylist(Playlist playlist) async {
    try {
      final uri = Uri.https(baseURL, 'playlist', {'playlist_id': playlist.id});
      final response = await dio.deleteUri(uri, data: playlist);
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

  /// GET /playlist
  Future<List<Playlist>> getAllPlaylist() async {
    try {
      final uri = Uri.https(baseURL, 'playlist');
      final response = await dio.getUri(uri);
      // When response status code is 200
      return (response.data as List).map((e) => Playlist.fromJson(e)).toList();
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

  /// GET /playlist/?playlist={$id}
  Future<Playlist> getPlaylistDetail(dynamic id) async {
    try {
      final uri = Uri.https(baseURL, 'playlist', {'playlist': id});
      final response = await dio.getUri(uri);
      // When response status code is 200
      return Playlist.fromJson(response.data);
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

  /// PATCH /playlist
  Future<JSON> modifyPlaylist(Playlist data) async {
    try {
      final uri = Uri.https(baseURL, 'playlist');
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
