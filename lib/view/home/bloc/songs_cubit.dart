import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usecases/songs/get_songs_usecase.dart';
import 'package:spotify_clone/service_locator.dart';
import 'package:spotify_clone/view/home/bloc/songs_state.dart';

class SongsCubit extends Cubit<SongsState> {
  SongsCubit() : super(SongsLoading());

  Future<void> getSongs() async {
    final songs = await sl<GetSongsUsecase>().call();
    songs.fold((l) {
      emit(SongsLoadFailure());
    }, (data) {
      emit(SongsLoaded(songs: data));});
  }
}
