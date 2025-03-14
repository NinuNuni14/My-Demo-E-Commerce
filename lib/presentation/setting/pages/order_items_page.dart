import 'package:e_commerce_project/common/widgets/appbar/basic_appbar.dart';
import 'package:e_commerce_project/domain/order/entity/product_order_entity.dart';
import 'package:e_commerce_project/presentation/setting/widgets/product_order_cart.dart';
import 'package:flutter/material.dart';

class OrderItemsPage extends StatelessWidget {
  final List<ProductOrderEntity> products;
  const OrderItemsPage({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppbar(
          title: Text('Order Items'),
        ),
        body: _products(products));
  }

  Widget _products(List<ProductOrderEntity> products) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return OrderItemsCart(productOrderEntity: products[index]);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 15);
        },
        itemCount: products.length);
  }
}
