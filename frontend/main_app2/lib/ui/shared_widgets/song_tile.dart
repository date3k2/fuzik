import 'package:flutter/material.dart';
import 'package:fuzik_app/models/entity/models.dart';
import 'package:fuzik_app/ui/pages/pages.dart';
import 'package:fuzik_app/ultility/controller/player/play_music_controller.dart';
import 'package:go_router/go_router.dart';

class SongTile extends StatelessWidget {
  final Song song;

  SongTile({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        bool result = await PlayMusicController.downloadMusicInfo(song, false);
        if (context.mounted) {
          context.pushNamed('playSong');
        }
      },
      onLongPress: () async {
        bool result = await PlayMusicController.downloadMusicInfo(song, true);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  result? "${song.name} đã được thêm vào danh sách phát hiện tại.": "${song.name} đã trong danh sách phát hiện tại.")));
        }
      },
      leading: Icon(Icons.music_note),
      title: Text(song.name ?? "Bài hát không có tên"),
      subtitle: Text(song.userId ?? "Vô danh"),
    );
  }
}
