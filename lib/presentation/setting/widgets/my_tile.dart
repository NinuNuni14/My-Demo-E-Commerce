import 'package:e_commerce_project/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  final String text;
  final Function() onTap;
  const MyTile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Container(
          height: 85,
          decoration: BoxDecoration(
              color: AppColors.secondBackground,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                const Icon(
                  Icons.arrow_right,
                  size: 50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
