import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/data/auth/models/user_creation_req.dart';
import 'package:e_commerce_project/data/auth/models/user_signin_req.dart';

abstract class AuthRepository {
  Future<Either> signup(UserCreationReq user);
  Future<Either> signin(UserSigninReq user);
  Future<Either> sendPasswordResetEmail(String email);
  Future<Either> getAges();
  Future<bool> isLoggedIn();
  Future<Either> getUser();
  Future<Either> signout();
}
