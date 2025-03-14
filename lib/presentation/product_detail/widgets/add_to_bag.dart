import 'package:e_commerce_project/common/bloc/button/button_state.dart';
import 'package:e_commerce_project/common/bloc/button/button_state_cubit.dart';
import 'package:e_commerce_project/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_project/common/helper/product/product_price_helper.dart';
import 'package:e_commerce_project/common/widgets/button/basic_reactive_button.dart';
import 'package:e_commerce_project/core/configs/theme/app_colors.dart';
import 'package:e_commerce_project/data/order/models/add_to_cart_req.dart';
import 'package:e_commerce_project/domain/order/usecases/add_to_cart_usecase.dart';
import 'package:e_commerce_project/domain/product/entity/product_entity.dart';
import 'package:e_commerce_project/presentation/cart/pages/cart_page.dart';
import 'package:e_commerce_project/presentation/product_detail/bloc/product_color_selection_cubit.dart';
import 'package:e_commerce_project/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:e_commerce_project/presentation/product_detail/bloc/product_sizes_selection_cubit.dart';
import 'package:e_commerce_project/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToBag extends StatelessWidget {
  final ProductEntity productEntity;
  const AddToBag({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ButtonStateCubit, ButtonState>(
      listener: (context, state) {
        if (state is ButtonSuccessState) {
          AppNavigator.push(context, const CartPage());
        }
        if (state is ButtonFailureState) {
          var snackbar = SnackBar(
            content: Text(state.errorMessage),
            behavior: SnackBarBehavior.floating,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: BasicReactiveButton(
            onPressed: () {
              context.read<ButtonStateCubit>().execute(
                  usecase: sl<AddToCartUsecase>(),
                  params: AddToCartReq(
                      productId: productEntity.productId,
                      productTitle: productEntity.title,
                      productQuantity:
                          context.read<ProductQuantityCubit>().state,
                      productColor: productEntity
                          .colors[context
                              .read<ProductColorSelectionCubit>()
                              .selectedIndex]
                          .title,
                      productSize: productEntity.sizes[context
                          .read<ProductSizesSelectionCubit>()
                          .selectedIndex],
                      productPrice: productEntity.price.toDouble(),
                      totalPrice:
                          ProductPriceHelper.currentPrice(productEntity) *
                              context.read<ProductQuantityCubit>().state,
                      productImage: productEntity.images[0],
                      createdDate: DateTime.now().toString()));
            },
            content: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<ProductQuantityCubit, int>(
                      builder: (context, state) {
                        var price =
                            ProductPriceHelper.currentPrice(productEntity) *
                                state;
                        return Text(
                          '$price\$',
                          style: const TextStyle(
                              fontSize: 17, color: Colors.white),
                        );
                      },
                    ),
                    const Text('Add to Bag',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
