import 'package:e_commerce_project/common/bloc/products/products_display_cubit.dart';
import 'package:e_commerce_project/common/bloc/products/products_display_state.dart';
import 'package:e_commerce_project/common/widgets/appbar/basic_appbar.dart';
import 'package:e_commerce_project/common/widgets/product/product_card.dart';
import 'package:e_commerce_project/domain/product/entity/product_entity.dart';
import 'package:e_commerce_project/domain/product/usecases/get_favorite_product_usecase.dart';
import 'package:e_commerce_project/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyFavoritePage extends StatelessWidget {
  const MyFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsDisplayCubit(useCase: sl<GetFavoriteProductUsecase>())
            ..displayProducts(),
      child: Scaffold(
        appBar: const BasicAppbar(),
        body: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
            builder: (context, state) {
          if (state is ProductsDisplayLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductsDisplayLoaded) {
            return _products(state.products);
          }
          if (state is LoadProductsDisplayFailure) {
            return const Text('Please try again');
          }
          return const SizedBox();
        }),
      ),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return Expanded(
      child: GridView.builder(
        itemCount: products.length,
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.6),
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(productEntity: products[index]);
        },
      ),
    );
  }
}
