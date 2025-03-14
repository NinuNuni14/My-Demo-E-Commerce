import 'package:e_commerce_project/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_project/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce_project/core/configs/assets/app_vectors.dart';
import 'package:e_commerce_project/core/configs/theme/app_colors.dart';
import 'package:e_commerce_project/presentation/home/pages/home_page.dart';
import 'package:flutter/material.dart';

class OrderPlacedPage extends StatelessWidget {
  const OrderPlacedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary,
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppVectors.orderPlaced,
                    color: AppColors.background,
                    scale: 1.5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Order Placed Successfully',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: BasicAppButton(
                  onPressed: () {
                    AppNavigator.pushAndRemove(context, const HomePage());
                  },
                  title: 'Finish',
                  color: false,
                ),
              ),
            )
          ],
        ));
  }
}
