import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String artist;
  final String album;
  final String coverUrl;
  final String songUrl;
  final String title;
  final Timestamp releaseDate;
  final double duration;

  SongEntity(
      {required this.artist,
      required this.album,
      required this.coverUrl,
      required this.songUrl,
      required this.title,
      required this.releaseDate,
      required this.duration});
}
