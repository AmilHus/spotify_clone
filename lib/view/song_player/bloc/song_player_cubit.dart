import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify_clone/view/song_player/bloc/song_player_state.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;
  bool isUserDragging = false;

  SongPlayerCubit() : super(SongPlayerisLoading()) {
    audioPlayer.positionStream.listen((position) {
      if (!isUserDragging) {
        songPosition = position;
        updateSongPlayer();
      }
    });

    audioPlayer.durationStream.listen((duration) {
      songDuration = duration!;
      updateSongPlayer();
    });
  }

  void updateSongPlayer() {
    if (!isClosed) {
      emit(SongPlayerisLoaded());
    }
  }

  Future<void> loadSong(String songUrl) async {
    try {
      await audioPlayer.setUrl(songUrl);
      if (!isClosed) {
        emit(SongPlayerisLoaded());
      }
    } catch (e) {
      if (!isClosed) {
        emit(SongPlayerisLoadFailure());
      }
    }
  }

  void playAndPauseSong() {
    try {
      if (audioPlayer.duration == null || songDuration == Duration.zero) {
        return; 
      }
      if (audioPlayer.playing) {
        audioPlayer.stop();
      } else {
        audioPlayer.play();
      }

      if (!isClosed) {
        emit(SongPlayerisLoaded());
      }
    } catch (e) {
      if (!isClosed) {
        emit(SongPlayerisLoadFailure());
      }
    }
  }

  void seekToPosition(double value) {
    final newPosition = Duration(seconds: value.toInt());
    audioPlayer.seek(newPosition);
    songPosition = newPosition;
    if (!isClosed) {
      emit(SongPlayerisLoaded());
    }
  }

  void setUserDragging(bool dragging) {
    isUserDragging = dragging;
  }

  @override
  Future<void> close() async {
    audioPlayer.dispose();
    super.close();
  }
}
