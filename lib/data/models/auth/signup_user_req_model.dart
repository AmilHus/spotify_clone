class SignUpUserRequestModel {
  final String fullname;
  final String email;
  final String password;

  SignUpUserRequestModel(
      {required this.email, required this.fullname, required this.password});
}
