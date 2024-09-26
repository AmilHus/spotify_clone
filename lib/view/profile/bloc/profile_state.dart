import 'package:spotify_clone/domain/entities/auth/user.dart';

abstract class ProfileInfoState {}

class ProfileInfoisLoading extends ProfileInfoState {}

class ProfileInfoisLoaded extends ProfileInfoState {
  final UserEntity userEntity;
  ProfileInfoisLoaded({required this.userEntity});
}

class ProfileInfoisLoadFailure extends ProfileInfoState {}
