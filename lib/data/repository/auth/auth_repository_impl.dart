import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/auth/signin_user_req_model.dart';
import 'package:spotify_clone/domain/repository/auth/auth_repository.dart';
import 'package:spotify_clone/service_locator.dart';

import '../../models/auth/signup_user_req_model.dart';
import '../../sources/auth/auth_firebase_service.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SignInUserRequestModel signInUserRequestModel) async {
    return await sl<AuthFirebaseService>().signin(signInUserRequestModel);
  }

  @override
  Future<Either> signup(SignUpUserRequestModel signUpUserRequestModel) async {
    return await sl<AuthFirebaseService>().signup(signUpUserRequestModel);
  }

  @override
  Future<Either> getUser() async {
    return await sl<AuthFirebaseService>().getUser();
  }
}
