import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/core/usecase/usecase.dart';
import 'package:e_commerce_project/data/order/models/order_registration_req.dart';
import 'package:e_commerce_project/domain/order/repository/order.dart';
import 'package:e_commerce_project/service_locator.dart';

class OrderRegistrationUsecase
    implements Usecase<Either, OrderRegistrationReq> {
  @override
  Future<Either> call({OrderRegistrationReq? params}) {
    return sl<OrderRepository>().orderRegistration(params!);
  }
}
