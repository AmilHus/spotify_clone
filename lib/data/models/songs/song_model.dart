import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_clone/domain/entities/songs/song_entity.dart';

class SongModel {
  late String artist;
  late String album;
  late String title;
  late String coverUrl;
  late String songUrl;
  late Timestamp releaseDate;
  late double duration;

  SongModel(
      {required this.artist,
      required this.album,
      required this.title,
      required this.coverUrl,
      required this.songUrl,
      required this.releaseDate,
      required this.duration});

  SongModel.fromJson(Map<String, dynamic> data) {
    artist = data['artist'];
    album = data['album'];
    title = data['title'];
    title = data['title'];
    coverUrl = data['coverUrl'];
    songUrl = data['songUrl'];
    releaseDate = data['releaseDate'];
    duration = data['duration'];
  }
}

extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
        artist: artist,
        album: album,
        title: title,
        coverUrl: coverUrl,
        songUrl: songUrl,
        releaseDate: releaseDate,
        duration: duration);
  }
}
