import 'package:e_commerce_project/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BasicAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final double? height;
  final Widget? title;
  final Widget? action;
  final bool? hideBack;
  const BasicAppbar(
      {super.key,
      this.backgroundColor,
      this.height,
      this.title,
      this.action,
      this.hideBack});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: backgroundColor ?? Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        toolbarHeight: height ?? 80,
        title: title ??
            const Text(
              '',
            ),
        titleSpacing: 0,
        actions: [action ?? Container()],
        leading: hideBack != null
            ? null
            : IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      color: AppColors.secondBackground,
                      shape: BoxShape.circle),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 15,
                    color: Colors.white,
                  ),
                )));
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 80);
}
