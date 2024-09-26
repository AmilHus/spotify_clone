import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/domain/usecases/auth/get_user_usecase.dart';
import 'package:spotify_clone/service_locator.dart';
import 'package:spotify_clone/view/profile/bloc/profile_state.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit() : super(ProfileInfoisLoading());

  Future<void> getUser() async {
    var user = await sl<GetUserUsecase>().call();

    user.fold((l) {
      emit(ProfileInfoisLoadFailure());
    }, (userEntity) {
      emit(ProfileInfoisLoaded(userEntity: userEntity));
    });
  }
}
