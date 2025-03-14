import 'package:e_commerce_project/common/bloc/button/button_state_cubit.dart';
import 'package:e_commerce_project/common/widgets/appbar/basic_appbar.dart';
import 'package:e_commerce_project/core/configs/theme/app_colors.dart';
import 'package:e_commerce_project/domain/order/entity/product_order_entity.dart';
import 'package:e_commerce_project/presentation/cart/bloc/cart_product_display_cubit.dart';
import 'package:e_commerce_project/presentation/cart/bloc/cart_product_display_state.dart';
import 'package:e_commerce_project/presentation/cart/widgets/checkout.dart';
import 'package:e_commerce_project/presentation/cart/widgets/product_order_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('Cart'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                CartProductDisplayCubit()..displayCartProducts(),
          ),
          BlocProvider(
            create: (context) => ButtonStateCubit(),
          ),
        ],
        child: BlocBuilder<CartProductDisplayCubit, CartProductDisplayState>(
          builder: (context, state) {
            if (state is CartProductDisplayLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartProductDisplayLoaded) {
              return state.products.isEmpty
                  ? _cartIsEmpty()
                  : Stack(
                      children: [
                        _products(state.products),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Checkout(
                              products: state.products,
                            ))
                      ],
                    );
            }
            if (state is LoadCartProductDisplayFailure) {
              var snackbar = SnackBar(
                content: Text(state.errorMessage),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _products(List<ProductOrderEntity> products) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ProductOrderCart(productOrderEntity: products[index]);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 15);
        },
        itemCount: products.length);
  }

  Widget _cartIsEmpty() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.remove_shopping_cart,
            color: AppColors.primary,
            size: 100,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Cart is Empty',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
