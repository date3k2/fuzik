import 'package:flutter/material.dart';
import 'package:fuzik_app/models/entity/playlist.dart';

class PlaylistView extends StatelessWidget {
  final Playlist? playlist;

  const PlaylistView({super.key, this.playlist});

  @override
  //TODO: Ghép model Playlist
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
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
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20)),
                    color: Colors.white54),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          playlist?.name ?? "Danh sách không có tên",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background),
                        ),
                        Text(
                          playlist?.userId ?? "Không rõ",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background),
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.play_arrow))
                  ],
                )),
          ],
        )),
      ),
    );
  }
}
