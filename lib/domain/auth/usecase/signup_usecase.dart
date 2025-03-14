import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/common/bloc/button/button_state.dart';
import 'package:e_commerce_project/core/usecase/usecase.dart';
import 'package:e_commerce_project/data/auth/models/user_creation_req.dart';
import 'package:e_commerce_project/domain/auth/repository/auth.dart';
import 'package:e_commerce_project/service_locator.dart';

class SignupUsecase implements Usecase<Either, UserCreationReq> {
  @override
  Future<Either> call({UserCreationReq? params}) async {
    try {
      final result = await sl<AuthRepository>().signup(params!);
      return Right(result);
    } catch (error) {
      return Left(ButtonFailureState(errorMessage: error.toString()));
    }
  }
}
