import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/data/order/models/add_to_cart_req.dart';
import 'package:e_commerce_project/data/order/models/order_model.dart';
import 'package:e_commerce_project/data/order/models/order_registration_req.dart';
import 'package:e_commerce_project/data/order/models/product_order_model.dart';
import 'package:e_commerce_project/data/order/source/order_firebase_service.dart';
import 'package:e_commerce_project/domain/order/repository/order.dart';
import 'package:e_commerce_project/service_locator.dart';

class OrderRepositoryImpl extends OrderRepository {
  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) async {
    return await sl<OrderFirebaseService>().addToCart(addToCartReq);
  }

  @override
  Future<Either> getCartProduct() async {
    var returnedData = await sl<OrderFirebaseService>().getCartProduct();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      try {
        var productList = (data as List<dynamic>).map((e) {
          var product =
              ProductOrderModel.fromMap(e as Map<String, dynamic>).toEntity();
          return product;
        }).toList();
        return Right(productList);
      } catch (e) {
        return Left(e);
      }
    });
  }

  @override
  Future<Either> removeCartProduct(String id) async {
    var returnedData = await sl<OrderFirebaseService>().removeCartProduct(id);
    return returnedData.fold((error) {
      return Left(error);
    }, (message) {
      try {
        return Right(message);
      } catch (e) {
        return Left(e);
      }
    });
  }

  @override
  Future<Either> orderRegistration(OrderRegistrationReq order) async {
    var returnedData =
        await sl<OrderFirebaseService>().orderRegistration(order);
    return returnedData.fold((error) {
      return Left(error);
    }, (message) {
      try {
        return Right(message);
      } catch (e) {
        return Left(e);
      }
    });
  }

  @override
  Future<Either> getOrder() async {
    var returnedData = await sl<OrderFirebaseService>().getOrder();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      try {
        var productList = (data as List<dynamic>).map((e) {
          var product =
              OrderModel.fromMap(e as Map<String, dynamic>).toEntity();

          return product;
        }).toList();
        return Right(productList);
      } catch (e) {
        return Left(e);
      }
    });
  }
}
