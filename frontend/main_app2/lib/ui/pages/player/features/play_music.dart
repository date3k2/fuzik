part of 'ui.dart';

class MusicPlayerPage extends StatelessWidget {
  static final GoRoute route = GoRoute(
    path: '/song/player',
    name: 'playSong',
    builder: (context, state) => MusicPlayerPage(),
  );

  const MusicPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: MusicPlayer()
    );
  }
}

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'PLAYING',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                BlocBuilder(
                  bloc: PlayMusicController.bloc,
                  builder: (context, Song? song) {
                    return Text(
                      song?.userId ?? "Ẩn danh",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                    );
                  }
                ),
                Container(
                  color: Theme.of(context).colorScheme.onSecondary,
                  height: 150.0,
                  width: 150.0,
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                ),
                BlocBuilder(
                  bloc: PlayMusicController.bloc,
                  builder: (context, Song? state) {
                    return Text(
                      state?.name ?? "Load...",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    );
                  }
                ),
              ],
            ),
          ),
        ),
        // Controls for the music player
        Container(
          color: Theme.of(context).colorScheme.surface,
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            children: [
              StreamBuilder(
                  stream: PlayMusicController.player.durationStream,
                  builder: (context, snapshot) {
                    Duration duration = snapshot.data ?? Duration.zero;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: StreamBuilder(
                          stream: PlayMusicController.player.positionStream,
                          builder: (context, snapshot) {
                            Duration position = snapshot.data ?? Duration.zero;
                            double percent =
                                position.inMicroseconds / (duration.inMicroseconds + 0.001);
                            return StreamBuilder(
                              stream: PlayMusicController.player.bufferedPositionStream,
                              builder: (context, snapshot) {
                                Duration buffPosition = snapshot.data ?? Duration.zero;
                                double buffPercent =
                                    buffPosition.inMicroseconds / (duration.inMicroseconds + 0.001);
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(DateFormat("m:ss").format(DateTime(2024).add(position))),
                                    Expanded(
                                      child: Slider(
                                        value: percent.clamp(0, 1),
                                        secondaryTrackValue: buffPercent.clamp(0, 1),
                                        // Current position of the song
                                        min: 0,
                                        max: 1,
                                        // Total length of the song
                                        onChanged: (value) async {
                                          await PlayMusicController.player.seek(Duration(
                                              microseconds:
                                                  (value * duration.inMicroseconds)
                                                      .toInt()));
                                        },
                                      ),
                                    ),
                                    Text(DateFormat("m:ss").format(DateTime(2024).add(duration)))
                                  ],
                                );
                              }
                            );
                          }),
                    );
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StreamBuilder(
                      stream: PlayMusicController.player.shuffleModeEnabledStream,
                      builder: (context, snapshot) {
                        return IconButton(
                          icon: Icon((snapshot.data ?? false)
                              ? Icons.shuffle_on
                              : Icons.shuffle),
                          onPressed: () async {
                            await PlayMusicController.player
                                .setShuffleModeEnabled(!snapshot.requireData);
                          },
                        );
                      }),
                  IconButton(
                    icon: Icon(Icons.skip_previous),
                    onPressed: () async {
                      await PlayMusicController.player.seekToPrevious();
                    },
                  ),
                  StreamBuilder(
                      stream: PlayMusicController.player.playingStream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return CircularProgressIndicator();
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
                  StreamBuilder(
                      stream: PlayMusicController.player.loopModeStream,
                      builder: (context, snapshot) {
                        Map mode = {
                          LoopMode.off: Icons.repeat,
                          LoopMode.one: Icons.repeat_one_on,
                          LoopMode.all: Icons.repeat_on
                        };
                        return IconButton(
                          icon: Icon(mode[snapshot.data ?? LoopMode.off]),
                          onPressed: () async {
                            switch (snapshot.requireData) {
                              case LoopMode.off:
                                await PlayMusicController.player.setLoopMode(LoopMode.one);
                                break;
                              case LoopMode.one:
                                await PlayMusicController.player.setLoopMode(LoopMode.all);
                                break;
                              case LoopMode.all:
                                await PlayMusicController.player.setLoopMode(LoopMode.off);
                                break;
                            }
                          },
                        );
                      }),
                ],
              ),
              // Additional icons for like, playlist add, and download
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
                      // Handle like action
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.playlist_add),
                    onPressed: () {
                      // Handle add to playlist action
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.file_download),
                    onPressed: () {
                      // Handle download action
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
