import 'package:flutter/material.dart';
import 'package:fuzik_app/models/entity/album.dart';
import 'package:fuzik_app/models/entity/song.dart';
import 'package:go_router/go_router.dart';

class AlbumView extends StatelessWidget {
  final Album? album;

  const AlbumView({super.key, this.album});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
            onTap: () {
              context.go('/song/3', extra: Song(name: 'Đạt', id: 3, createdAt: DateTime.now(), link: 'file_example_MP3_2MG.mp3', userId: '1'));
            },
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                //Layer 0: Event background
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //Layer 1: Details
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                      color: Colors.white54
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(album?.name ?? "Album không có tên", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.background),),
                      Text(album?.userId ?? "Vô danh", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.background),)
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}