import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/core/usecase/usecase.dart';
import 'package:e_commerce_project/domain/order/repository/order.dart';
import 'package:e_commerce_project/service_locator.dart';

class RemoveCartProductUsecase implements Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) {
    return sl<OrderRepository>().removeCartProduct(params!);
  }
}
