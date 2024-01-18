import 'package:fuzik_app/repositories/album_repo.dart';
import 'package:fuzik_app/repositories/auth_repo.dart';
import 'package:fuzik_app/repositories/concert_repo.dart';
import 'package:fuzik_app/repositories/group_repo.dart';
import 'package:fuzik_app/repositories/playlist_repo.dart';
import 'package:fuzik_app/repositories/song_repo.dart';
import 'package:fuzik_app/repositories/user_repo.dart';

/// Auth Repository cho việc xác thực người dùng
final authRepo = AuthRepository();
/// User Repository cho việc truy xuất thông tin người dùng
final userRepo = UserRepository();
/// Song Repository cho việc truy xuất thông tin bài hát
final songRepo = SongRepository();
/// Playlist Repository cho việc truy xuất thông tin danh sách phát
final playlistRepo = PlaylistRepository();
/// Group Repository cho việc truy xuất thông tin nhóm (studio)
final groupRepo = GroupRepository();
/// Album Repository cho việc truy xuất thông tin của album
final albumRepo = AlbumRepository();
/// Concert Repository cho việc truy xuất thông tin của concert
final concertRepo = ConcertRepository();