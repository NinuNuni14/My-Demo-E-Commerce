import 'package:e_commerce_project/domain/order/entity/product_order_entity.dart';

abstract class CartProductDisplayState {}

class CartProductDisplayLoading extends CartProductDisplayState {}

class CartProductDisplayLoaded extends CartProductDisplayState {
  final List<ProductOrderEntity> products;

  CartProductDisplayLoaded({required this.products});
}

class LoadCartProductDisplayFailure extends CartProductDisplayState {
  final String errorMessage;

  LoadCartProductDisplayFailure({required this.errorMessage});
}
