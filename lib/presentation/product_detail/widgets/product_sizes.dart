import 'package:e_commerce_project/common/helper/bottomsheet/app_bottomsheet.dart';
import 'package:e_commerce_project/core/configs/theme/app_colors.dart';
import 'package:e_commerce_project/domain/product/entity/product_entity.dart';
import 'package:e_commerce_project/presentation/product_detail/bloc/product_sizes_selection_cubit.dart';
import 'package:e_commerce_project/presentation/product_detail/widgets/product_sizes_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSizes extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductSizes({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomsheet.display(
          context,
          BlocProvider.value(
            value: BlocProvider.of<ProductSizesSelectionCubit>(context),
            child: ProductSizesOptions(productEntity: productEntity),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.secondBackground,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sizes',
                  style: TextStyle(fontSize: 17),
                ),
                Row(
                  children: [
                    BlocBuilder<ProductSizesSelectionCubit, int>(
                      builder: (context, state) {
                        return Text(
                          productEntity.sizes[state],
                          style: const TextStyle(fontSize: 17),
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
