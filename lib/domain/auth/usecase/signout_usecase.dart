import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/core/usecase/usecase.dart';
import 'package:e_commerce_project/domain/auth/repository/auth.dart';
import 'package:e_commerce_project/service_locator.dart';

class SignoutUsecase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return sl<AuthRepository>().signout();
  }
}
