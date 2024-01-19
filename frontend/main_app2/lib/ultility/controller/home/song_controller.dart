import 'package:flutter/material.dart';
import 'package:fuzik_app/models/entity/album.dart';
import 'package:fuzik_app/models/entity/concert.dart';
import 'package:fuzik_app/models/entity/playlist.dart';
import 'package:fuzik_app/models/entity/song.dart';
import 'package:fuzik_app/repositories/repo.dart';

class SongController with ChangeNotifier {
  final BuildContext context;

  SongController(this.context);

  Future<List<Song>> getSong = songRepo.searchSongByQuery('');

  Future<void> refresh() async {
    notifyListeners();
  }
}
