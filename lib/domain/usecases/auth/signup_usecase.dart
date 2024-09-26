import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/models/auth/signup_user_req_model.dart';
import 'package:spotify_clone/domain/repository/auth/auth_repository.dart';
import 'package:spotify_clone/service_locator.dart';

class SignupUseCase implements UseCase<Either, SignUpUserRequestModel> {
  @override
  Future<Either> call({SignUpUserRequestModel? params}) {
    return sl<AuthRepository>().signup(params!);
  }
}
