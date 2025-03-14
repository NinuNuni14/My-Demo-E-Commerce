import 'package:e_commerce_project/common/helper/cart/cart_helper.dart';
import 'package:e_commerce_project/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_project/common/widgets/button/basic_reactive_button.dart';
import 'package:e_commerce_project/core/configs/theme/app_colors.dart';
import 'package:e_commerce_project/domain/order/entity/product_order_entity.dart';
import 'package:e_commerce_project/presentation/cart/pages/checkout_page.dart';
import 'package:flutter/material.dart';

class Checkout extends StatelessWidget {
  final List<ProductOrderEntity> products;
  const Checkout({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: const BoxDecoration(color: AppColors.background),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Subtotal',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text('\$${CartHelper.calculateCartSubtotal(products)}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Shipping Cost',
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
                Text('\$8',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tax', style: TextStyle(fontSize: 16, color: Colors.grey)),
                Text('\$0.0',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total',
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
                Text('\$${CartHelper.calculateCartSubtotal(products) + 8}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            BasicReactiveButton(
              onPressed: () {
                AppNavigator.push(context, CheckoutPage(products: products));
              },
              title: 'Checkout',
            )
          ],
        ),
      ),
    );
  }
}
