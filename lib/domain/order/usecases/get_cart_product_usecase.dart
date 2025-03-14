import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/core/usecase/usecase.dart';
import 'package:e_commerce_project/domain/order/repository/order.dart';
import 'package:e_commerce_project/service_locator.dart';

class GetCartProductUsecase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) {
    return sl<OrderRepository>().getCartProduct();
  }
}
