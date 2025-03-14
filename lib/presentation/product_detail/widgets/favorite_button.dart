import 'package:e_commerce_project/core/configs/theme/app_colors.dart';
import 'package:e_commerce_project/domain/product/entity/product_entity.dart';
import 'package:e_commerce_project/presentation/product_detail/bloc/favorite_icon_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteButton extends StatelessWidget {
  final ProductEntity productEntity;
  const FavoriteButton({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: IconButton(
          onPressed: () {
            context.read<FavoriteIconCubit>().onTap(productEntity);
          },
          icon: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  color: AppColors.secondBackground, shape: BoxShape.circle),
              child: BlocBuilder<FavoriteIconCubit, bool>(
                builder: (context, state) {
                  return Icon(
                    Icons.favorite,
                    color: state ? Colors.red : Colors.white,
                  );
                },
              ))),
    );
  }
}
