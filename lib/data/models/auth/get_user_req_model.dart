import 'package:spotify_clone/domain/entities/auth/user.dart';

class UserModel {
  String? fullName;
  String? email;

  UserModel({this.email, this.fullName});


  UserModel.fromJson(Map<String, dynamic>? data) {
    fullName = data?['fullName'];
    email = data?['email'];
  }

}

extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      email:email,
      fullName: fullName
    );
  }
}




