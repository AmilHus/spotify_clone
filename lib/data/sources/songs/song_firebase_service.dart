import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/songs/song_model.dart';
import 'package:spotify_clone/domain/entities/songs/song_entity.dart';

abstract class SongFirebaseService {
  Future<Either> getNewSongs();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewSongs() async {
    try {
      List<SongEntity> songsList = [];
      final data = await FirebaseFirestore.instance
          .collection('songs')
          .orderBy('releaseDate', descending: true)
          .limit(5)
          .get();

      for (final song in data.docs) {
        final songModel = SongModel.fromJson(song.data());
        songsList.add(songModel.toEntity());
      }
      return Right(songsList);
    } catch (e) {
      return Left('An error occurred: $e, please try again');
    }
  }
}
