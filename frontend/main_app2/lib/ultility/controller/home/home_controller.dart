import 'package:flutter/material.dart';
import 'package:fuzik_app/models/entity/album.dart';
import 'package:fuzik_app/models/entity/concert.dart';
import 'package:fuzik_app/models/entity/playlist.dart';
import 'package:fuzik_app/repositories/repo.dart';

class HomeController with ChangeNotifier {
  final BuildContext context;

  HomeController(this.context);

  Future getConcert = concertRepo.getAllConcert();
  Future getAlbum = albumRepo.getAllAlbum();
  Future getPlaylist = playlistRepo.getAllPlaylist();

  Future<void> refresh() async {
    notifyListeners();
  }

  Future<NecessaryHomeInfo> get getNecessaryInfo =>
      Future.wait([getConcert, getAlbum, getPlaylist]).then((value) =>
          NecessaryHomeInfo(
              concerts: value[0], albums: value[1], playlists: value[2]));
}

class NecessaryHomeInfo {
  List<Concert> concerts;
  List<Album> albums;
  List<Playlist> playlists;

  NecessaryHomeInfo(
      {required this.concerts, required this.albums, required this.playlists});
}