import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuzik_app/models/entity/song.dart';

class SongBloc extends Cubit<Song?> {
  SongBloc(super.initialState);

  @override
  void emit(Song? state) {
    super.emit(state);
  }
}