import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/data/models/auth/signin_user_req_model.dart';
import 'package:spotify_clone/domain/repository/auth/auth_repository.dart';
import 'package:spotify_clone/service_locator.dart';

class SignInUseCase implements UseCase<Either, SignInUserRequestModel> {
  @override
  Future<Either> call({SignInUserRequestModel? params}) {
    return sl<AuthRepository>().signin(params!);
  }
}
