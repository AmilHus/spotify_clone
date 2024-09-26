import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_clone/data/models/auth/get_user_req_model.dart';
import 'package:spotify_clone/data/models/auth/signin_user_req_model.dart';
import 'package:spotify_clone/data/models/auth/signup_user_req_model.dart';
import 'package:spotify_clone/domain/entities/auth/user.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(SignUpUserRequestModel signUpUserRequestModel);

  Future<Either> signin(SignInUserRequestModel signInUserRequestModel);

  Future<Either> getUser();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SignInUserRequestModel signInUserRequestModel) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signInUserRequestModel.email,
          password: signInUserRequestModel.password);
      return const Right('Sign In Was Succesfull');
    } on FirebaseAuthException catch (e) {
      String message = '';
      switch (e.code) {
        case 'invalid-email':
          message = "Email doesn't exist";
          break;
        case 'invalid-credential':
          message = 'Wrong password provided for that user';
          break;
        default:
          message = 'An unexpected error occurred';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signup(SignUpUserRequestModel signUpUserRequestModel) async {
    try {
      final data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: signUpUserRequestModel.email,
          password: signUpUserRequestModel.password);

      FirebaseFirestore.instance.collection('users').doc(data.user?.uid).set({
        'fullName': signUpUserRequestModel.fullname,
        'email': data.user?.email,
      });

      return const Right('Sign Up Was Succesfull');
    } on FirebaseAuthException catch (e) {
      String message = '';
      switch (e.code) {
        case 'invalid-email':
          message = "Email doesn't exist";
          break;
        case 'email-already-in-use':
          message = "Email is already used by another person";
          break;
        case 'invalid-credential':
          message = 'Wrong password provided for that user';
          break;
        case 'weak-password':
          message = 'Password should be at least 6 characters';
        default:
          message = 'An unexpected error occurred';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> getUser() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    try {
      final user = await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser?.uid)
          .get();

      UserModel userModel = UserModel.fromJson(user.data()!);

      UserEntity userEntity = userModel.toEntity();
      return Right(userEntity);
    } catch (e) {
      return Left('An error occuerred: $e');
    }
  }
}
