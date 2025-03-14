import 'package:e_commerce_project/common/bloc/button/button_state.dart';
import 'package:e_commerce_project/common/bloc/button/button_state_cubit.dart';
import 'package:e_commerce_project/common/helper/cart/cart_helper.dart';
import 'package:e_commerce_project/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_project/common/widgets/appbar/basic_appbar.dart';
import 'package:e_commerce_project/common/widgets/button/basic_reactive_button.dart';
import 'package:e_commerce_project/data/order/models/order_registration_req.dart';
import 'package:e_commerce_project/domain/order/entity/product_order_entity.dart';
import 'package:e_commerce_project/domain/order/usecases/order_registration_usecase.dart';
import 'package:e_commerce_project/presentation/cart/pages/order_placed_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutPage extends StatelessWidget {
  final List<ProductOrderEntity> products;
  CheckoutPage({super.key, required this.products});

  final TextEditingController _addressCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonStateCubit(),
      child: BlocListener<ButtonStateCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonSuccessState) {
            AppNavigator.pushAndRemove(context, const OrderPlacedPage());
          }
          if (state is ButtonFailureState) {
            var snackbar = SnackBar(
              content: Text(state.errorMessage),
              behavior: SnackBarBehavior.floating,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          }
        },
        child: Scaffold(
          appBar: const BasicAppbar(
            title: Text('Checkout'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _addressField(context),
                _orderButton(context, products)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _addressField(BuildContext context) {
    return TextField(
      controller: _addressCon,
      minLines: 2,
      maxLines: 4,
      decoration: const InputDecoration(hintText: 'Shipping Address'),
    );
  }

  Widget _orderButton(BuildContext context, List<ProductOrderEntity> products) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          context.read<ButtonStateCubit>().execute(
              usecase: OrderRegistrationUsecase(),
              params: OrderRegistrationReq(
                  products: products,
                  createdDate: DateTime.now().toString(),
                  shippingAddress: _addressCon.text,
                  itemCount: products.length,
                  totalPrice: CartHelper.calculateCartSubtotal(products)));
        },
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${CartHelper.calculateCartSubtotal(products)}',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              const Text(
                'Place Order',
                style: TextStyle(color: Colors.white, fontSize: 17),
              )
            ],
          ),
        ),
      );
    });
  }
}
