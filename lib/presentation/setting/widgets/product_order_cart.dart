import 'package:e_commerce_project/core/configs/assets/app_images.dart';
import 'package:e_commerce_project/core/configs/theme/app_colors.dart';
import 'package:e_commerce_project/domain/order/entity/product_order_entity.dart';
import 'package:flutter/material.dart';

class OrderItemsCart extends StatelessWidget {
  final ProductOrderEntity productOrderEntity;
  const OrderItemsCart({super.key, required this.productOrderEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.secondBackground,
            borderRadius: BorderRadius.circular(10)),
        width: double.infinity,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      image: DecorationImage(
                          image: AssetImage(AppImages.products +
                              productOrderEntity.productImage),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        productOrderEntity.productTitle,
                        style: const TextStyle(fontSize: 17),
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Size ',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                productOrderEntity.productSize,
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Color ',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                productOrderEntity.productColor,
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Quantity ',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                productOrderEntity.productQuantity.toString(),
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '\$${productOrderEntity.totalPrice}',
                    style: const TextStyle(fontSize: 17),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
