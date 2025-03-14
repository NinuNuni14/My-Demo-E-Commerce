import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/data/auth/models/user_creation_req.dart';
import 'package:e_commerce_project/data/auth/models/user_model.dart';
import 'package:e_commerce_project/data/auth/models/user_signin_req.dart';
import 'package:e_commerce_project/data/auth/source/auth_firebase_service.dart';
import 'package:e_commerce_project/domain/auth/repository/auth.dart';
import 'package:e_commerce_project/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(UserCreationReq user) async {
    return sl<AuthFirebaseService>().signup(user);
  }

  @override
  Future<Either> getAges() async {
    return await sl<AuthFirebaseService>().getAges();
  }

  @override
  Future<Either> signin(UserSigninReq user) async {
    return await sl<AuthFirebaseService>().signin(user);
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    return await sl<AuthFirebaseService>().sendPasswordResetEmail(email);
  }

  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthFirebaseService>().isLoggedIn();
  }

  @override
  Future<Either> getUser() async {
    var user = await sl<AuthFirebaseService>().getUser();

    return user.fold((error) {
      return Left(error.toString());
    }, (data) {
      if (data == null || data.isEmpty) {
        return const Left("No user data found.");
      }

      // Use fromMap instead of fromJson because data is already a Map
      try {
        final userEntity = UserModel.fromMap(data).toEntity(); // Updated here
        return Right(userEntity);
      } catch (e) {
        return const Left("Error parsing user data.");
      }
    });
  }

  @override
  Future<Either> signout() async {
    return await sl<AuthFirebaseService>().signout();
  }
}
