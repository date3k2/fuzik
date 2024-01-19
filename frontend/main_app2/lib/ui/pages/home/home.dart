import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuzik_app/data/storage.dart';
import 'package:fuzik_app/repositories/base.dart';
import 'package:fuzik_app/ui/pages/information/features/ui.dart';
import 'package:fuzik_app/ui/shared_widgets/album_view.dart';
import 'package:fuzik_app/ui/shared_widgets/event_view.dart';
import 'package:fuzik_app/ui/shared_widgets/playlist_view.dart';
import 'package:fuzik_app/ui/shared_widgets/song_tile.dart';
import 'package:fuzik_app/ultility/controller/home/home_controller.dart';
import 'package:fuzik_app/ultility/controller/home/song_controller.dart';
import 'package:fuzik_app/ultility/controller/player/play_music_controller.dart';
import 'package:go_router/go_router.dart';

part 'feature/home_page.dart';
part 'feature/musician_page.dart';
part 'feature/song_page.dart';
part 'feature/album_page.dart';

part 'feature/main_page.dart';
