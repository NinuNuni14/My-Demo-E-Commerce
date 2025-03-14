import 'package:e_commerce_project/common/bloc/button/button_state_cubit.dart';
import 'package:e_commerce_project/common/widgets/appbar/basic_appbar.dart';
import 'package:e_commerce_project/domain/product/entity/product_entity.dart';
import 'package:e_commerce_project/presentation/product_detail/bloc/favorite_icon_cubit.dart';
import 'package:e_commerce_project/presentation/product_detail/bloc/product_color_selection_cubit.dart';
import 'package:e_commerce_project/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:e_commerce_project/presentation/product_detail/bloc/product_sizes_selection_cubit.dart';
import 'package:e_commerce_project/presentation/product_detail/widgets/add_to_bag.dart';
import 'package:e_commerce_project/presentation/product_detail/widgets/favorite_button.dart';
import 'package:e_commerce_project/presentation/product_detail/widgets/product_color.dart';
import 'package:e_commerce_project/presentation/product_detail/widgets/product_images.dart';
import 'package:e_commerce_project/presentation/product_detail/widgets/product_price.dart';
import 'package:e_commerce_project/presentation/product_detail/widgets/product_quantity.dart';
import 'package:e_commerce_project/presentation/product_detail/widgets/product_sizes.dart';
import 'package:e_commerce_project/presentation/product_detail/widgets/product_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailPage({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductQuantityCubit(),
        ),
        BlocProvider(
          create: (context) => ProductColorSelectionCubit(),
        ),
        BlocProvider(
          create: (context) => ProductSizesSelectionCubit(),
        ),
        BlocProvider(
          create: (context) => ButtonStateCubit(),
        ),
        BlocProvider(
            create: (context) =>
                FavoriteIconCubit()..isFavorite(productEntity.productId)),
      ],
      child: Scaffold(
          appBar: BasicAppbar(
            action: FavoriteButton(
              productEntity: productEntity,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImages(productEntity: productEntity),
                  const SizedBox(
                    height: 20,
                  ),
                  ProductTitle(productEntity: productEntity),
                  const SizedBox(
                    height: 10,
                  ),
                  ProductPrice(productEntity: productEntity),
                  const SizedBox(
                    height: 20,
                  ),
                  ProductSizes(productEntity: productEntity),
                  ProductColor(productEntity: productEntity),
                  const ProductQuantity(),
                  const SizedBox(
                    height: 20,
                  ),
                  AddToBag(productEntity: productEntity),
                ],
              ),
            ),
          )),
    );
  }
}
