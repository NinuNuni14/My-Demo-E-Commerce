import 'package:e_commerce_project/core/configs/theme/app_colors.dart';
import 'package:e_commerce_project/domain/product/entity/product_entity.dart';
import 'package:e_commerce_project/presentation/product_detail/bloc/product_sizes_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSizesOptions extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductSizesOptions({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            child: Stack(
              children: [
                const Center(
                  child: Text(
                    'Size',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BlocBuilder<ProductSizesSelectionCubit, int>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<ProductSizesSelectionCubit>()
                              .selectSize(index);
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              color: state == index
                                  ? AppColors.primary
                                  : AppColors.secondBackground,
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                productEntity.sizes[index],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              state == index
                                  ? const Icon(
                                      Icons.check,
                                      size: 30,
                                    )
                                  : const SizedBox(
                                      width: 30,
                                    )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: productEntity.sizes.length),
          ),
        ],
      ),
    );
  }
}
