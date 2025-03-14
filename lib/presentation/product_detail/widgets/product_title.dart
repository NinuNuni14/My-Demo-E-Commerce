import 'package:e_commerce_project/domain/product/entity/product_entity.dart';
import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductTitle({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Text(
      productEntity.title,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}
