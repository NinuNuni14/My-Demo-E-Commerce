import 'package:e_commerce_project/domain/order/entity/product_order_entity.dart';
import 'package:e_commerce_project/domain/order/usecases/get_cart_product_usecase.dart';
import 'package:e_commerce_project/domain/order/usecases/remove_cart_product_usecase.dart';
import 'package:e_commerce_project/presentation/cart/bloc/cart_product_display_state.dart';
import 'package:e_commerce_project/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductDisplayCubit extends Cubit<CartProductDisplayState> {
  CartProductDisplayCubit() : super(CartProductDisplayLoading());

  void displayCartProducts() async {
    var returnedData = await sl<GetCartProductUsecase>().call();

    returnedData.fold((error) {
      emit(LoadCartProductDisplayFailure(errorMessage: error));
    }, (data) {
      emit(CartProductDisplayLoaded(products: data));
    });
  }

  void removeCartProduct(ProductOrderEntity products) async {
    emit(CartProductDisplayLoading());
    var returnedData =
        await sl<RemoveCartProductUsecase>().call(params: products.id);

    returnedData.fold((error) {
      emit(LoadCartProductDisplayFailure(errorMessage: error));
    }, (data) {
      displayCartProducts();
    });
  }
}
