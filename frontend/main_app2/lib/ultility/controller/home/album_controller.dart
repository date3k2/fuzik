import 'package:flutter/material.dart';
import 'package:fuzik_app/models/entity/album.dart';
import 'package:fuzik_app/models/entity/concert.dart';
import 'package:fuzik_app/models/entity/playlist.dart';
import 'package:fuzik_app/repositories/repo.dart';

class AlbumController with ChangeNotifier {
  final BuildContext context;

  AlbumController(this.context);

  Future getAlbum = albumRepo.getAllAlbum();

  Future<void> refresh() async {
    notifyListeners();
  }
}