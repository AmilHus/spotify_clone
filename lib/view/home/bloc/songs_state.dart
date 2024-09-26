import 'package:spotify_clone/domain/entities/songs/song_entity.dart';

abstract class SongsState {}

class SongsLoading extends SongsState {}

class SongsLoaded extends SongsState {
  final List<SongEntity> songs;

  SongsLoaded({required this.songs});
}

class SongsLoadFailure extends SongsState {}
