import 'package:e_commerce_project/domain/product/entity/product_entity.dart';

abstract class ProductsDisplayState {}

class ProductsDisplayInitial extends ProductsDisplayState {}

class ProductsDisplayLoading extends ProductsDisplayState {}

class ProductsDisplayLoaded extends ProductsDisplayState {
  final List<ProductEntity> products;

  ProductsDisplayLoaded({required this.products});
}

class LoadProductsDisplayFailure extends ProductsDisplayState {}
