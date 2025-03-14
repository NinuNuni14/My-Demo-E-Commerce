import 'package:e_commerce_project/domain/order/entity/order_status_entity.dart';
import 'package:e_commerce_project/domain/order/entity/product_order_entity.dart';

class OrderEntity {
  final List<ProductOrderEntity> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  final String code;
  final List<OrderStatusEntity> orderStatus;

  OrderEntity(
      {required this.products,
      required this.createdDate,
      required this.shippingAddress,
      required this.itemCount,
      required this.totalPrice,
      required this.code,
      required this.orderStatus});
}
