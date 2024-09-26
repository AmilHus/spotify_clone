import 'package:dartz/dartz.dart';
import 'package:spotify_clone/data/models/auth/signin_user_req_model.dart';

import '../../../data/models/auth/signup_user_req_model.dart';

abstract class AuthRepository {
  Future<Either> signup(SignUpUserRequestModel signUpUserRequestModel);

  Future<Either> signin(SignInUserRequestModel signInUserRequestModel);

  Future<Either> getUser();
}
