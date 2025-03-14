import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/core/usecase/usecase.dart';
import 'package:e_commerce_project/data/order/models/add_to_cart_req.dart';
import 'package:e_commerce_project/domain/order/repository/order.dart';
import 'package:e_commerce_project/service_locator.dart';

class AddToCartUsecase implements Usecase<Either, AddToCartReq> {
  @override
  Future<Either> call({AddToCartReq? params}) {
    return sl<OrderRepository>().addToCart(params!);
  }
}
