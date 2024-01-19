import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fuzik_app/blocs/song/song_bloc.dart';
import 'package:fuzik_app/models/entity/models.dart';
import 'package:fuzik_app/repositories/repo.dart';
import 'package:fuzik_app/ui/navigator/navigator.dart';
import 'package:fuzik_app/ui/pages/player/features/play_music_smaller.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

abstract class PlayMusicController {
  static final player = AudioPlayer();
  static ConcatenatingAudioSource playList = ConcatenatingAudioSource(
      useLazyPreparation: true,
      shuffleOrder: DefaultShuffleOrder(),
      children: []
  );

  static List<Song> songPlaying = [];

  static SongBloc bloc = SongBloc(null);

  static Widget? bottomSheet;

  static Future<bool> downloadMusicInfo(Song song, bool isAddToList) async {
    if (songPlaying.contains(song)) {
      return false;
    }
    String path = await songRepo.getLinkOfSong(song.link);
    AudioSource source = AudioSource.uri(Uri.parse(path), tag: MediaItem(
        id: song.id.toString(),
        title: song.name,
        artist: song.userId
    ));
    if (!isAddToList) {
      await playList.clear();
      songPlaying.clear();
    }
    bool isPlaying = songPlaying.isNotEmpty;
    await playList.add(source);
    songPlaying.add(song);
    if (!isPlaying) {
      await player.setAudioSource(playList, preload: false);
      player.play();
    }
    return true;
  }

  static init() {
    callback(event) {
      bloc.emit(songPlaying.elementAtOrNull(player.currentIndex ?? 0));
      print(bloc.state?.toJson());
      if (bloc.state != null) {
        bottomSheet = const MusicPlayerSmaller();
      }
      else {
        bottomSheet = null;
      }
    }
    player.sequenceStream.listen(callback);
    player.currentIndexStream.listen(callback);
  }
}
