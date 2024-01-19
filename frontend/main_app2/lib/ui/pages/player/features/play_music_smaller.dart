import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuzik_app/models/entity/song.dart';
import 'package:fuzik_app/ui/pages/player/features/ui.dart';
import 'package:fuzik_app/ultility/controller/player/play_music_controller.dart';

class MusicPlayerSmaller extends StatefulWidget {
  const MusicPlayerSmaller({super.key});

  @override
  State<MusicPlayerSmaller> createState() => _MusicPlayerSmallerState();
}

class _MusicPlayerSmallerState extends State<MusicPlayerSmaller> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
          isScrollControlled: true,
          useRootNavigator: true,
          useSafeArea: true,
          context: context,
          builder: (context) => MusicPlayer()),
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 50, child: Icon(Icons.music_note)),
                  Expanded(
                    child: BlocBuilder(
                        bloc: PlayMusicController.bloc,
                        builder: (context, Song? song) {
                          return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(song?.name ?? "Không tên", style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
                                Text(song?.userId ?? "Ẩn danh",  style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w400))
                              ]);
                        }),
                  ),
                  IconButton(
                    icon: Icon(Icons.skip_previous),
                    onPressed: () async {
                      await PlayMusicController.player.seekToPrevious();
                    },
                  ),
                  StreamBuilder(
                      stream: PlayMusicController.player.playingStream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return CircularProgressIndicator();
                        return IconButton(
                          icon: Icon(snapshot.requireData
                              ? Icons.pause
                              : Icons.play_arrow),
                          onPressed: () async {
                            if (snapshot.requireData) {
                              await PlayMusicController.player.pause();
                            } else {
                              await PlayMusicController.player.play();
                            }
                          },
                        );
                      }),
                  IconButton(
                    icon: Icon(Icons.skip_next),
                    onPressed: () async {
                      // Handle skip next action
                      await PlayMusicController.player.seekToNext();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.stop),
                    onPressed: () async {
                      // Handle skip next action
                      await PlayMusicController.player.stop();
                      PlayMusicController.songPlaying.clear();
                      await PlayMusicController.playList.clear();
                    },
                  ),
                ],
              ),
            ),
            StreamBuilder(
                stream: PlayMusicController.player.durationStream,
                builder: (context, snapshot) {
                  Duration duration = snapshot.data ?? Duration.zero;
                  return StreamBuilder(
                      stream: PlayMusicController.player.positionStream,
                      builder: (context, snapshot) {
                        Duration position = snapshot.data ?? Duration.zero;
                        double percent =
                            position.inMicroseconds / (duration.inMicroseconds + 0.001);
                        return StreamBuilder(
                            stream: PlayMusicController
                                .player.bufferedPositionStream,
                            builder: (context, snapshot) {
                              Duration buffPosition =
                                  snapshot.data ?? Duration.zero;
                              double buffPercent = buffPosition.inMicroseconds /
                                  (duration.inMicroseconds + 0.001);
                              return Slider(
                                value: percent.clamp(0, 1),
                                secondaryTrackValue: buffPercent.clamp(0, 1),
                                allowedInteraction: SliderInteraction.slideOnly,
                                // Current position of the song
                                min: 0,
                                max: 1,
                                // Total length of the song
                                onChanged: (value) async {
                                  await PlayMusicController.player.seek(
                                      Duration(
                                          microseconds:
                                              (value * duration.inMicroseconds)
                                                  .toInt()));
                                },
                              );
                            });
                      });
                }),
          ],
        ),
      ),
    );
  }
}
