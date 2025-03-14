import 'package:e_commerce_project/core/configs/theme/app_colors.dart';
import 'package:e_commerce_project/domain/product/entity/product_entity.dart';
import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductPrice({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${productEntity.discountedPrice != 0 ? productEntity.discountedPrice : productEntity.price}\$',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 10,
        ),
        productEntity.discountedPrice != 0
            ? Text(
                '${productEntity.price}\$',
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough,
                    color: AppColors.primary),
              )
            : const SizedBox(),
      ],
    );
  }
}
