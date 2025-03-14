import 'package:e_commerce_project/data/order/models/product_order_model.dart';
import 'package:e_commerce_project/domain/order/entity/product_order_entity.dart';

class OrderRegistrationReq {
  final List<ProductOrderEntity> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;

  OrderRegistrationReq(
      {required this.products,
      required this.createdDate,
      required this.shippingAddress,
      required this.itemCount,
      required this.totalPrice});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((e) => e.fromEntity().toMap()).toList(),
      'createdDate': createdDate,
      'itemCount': itemCount,
      'totalPrice': totalPrice,
      'shippingAddress': shippingAddress,
    };
  }
}
