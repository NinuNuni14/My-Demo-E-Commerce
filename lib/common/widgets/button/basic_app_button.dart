import 'package:e_commerce_project/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final Widget? content;
  final double? height;
  final double? width;
  final bool color;

  const BasicAppButton({
    super.key,
    required this.onPressed,
    this.title = '',
    this.height,
    this.width,
    this.content,
    this.color = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize:
            Size(width ?? MediaQuery.of(context).size.width, height ?? 50),
        backgroundColor: color ? AppColors.primary : AppColors.background,
      ),
      child: content ??
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400),
          ),
    );
  }
}
