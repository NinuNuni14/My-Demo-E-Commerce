import 'package:e_commerce_project/common/bloc/products/products_display_cubit.dart';
import 'package:e_commerce_project/common/bloc/products/products_display_state.dart';
import 'package:e_commerce_project/common/widgets/appbar/basic_appbar.dart';
import 'package:e_commerce_project/common/widgets/product/product_card.dart';
import 'package:e_commerce_project/domain/category/entity/category_entity.dart';
import 'package:e_commerce_project/domain/product/entity/product_entity.dart';
import 'package:e_commerce_project/domain/product/usecases/get_product_by_categories_id_usecase.dart';
import 'package:e_commerce_project/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryProductPage extends StatelessWidget {
  final CategoryEntity categoryEntity;
  const CategoryProductPage({super.key, required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppbar(),
        body: BlocProvider(
          create: (context) => ProductsDisplayCubit(
              useCase: sl<GetProductByCategoriesIdUsecase>())
            ..displayProducts(params: categoryEntity.categoryId),
          child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
            builder: (context, state) {
              if (state is ProductsDisplayLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductsDisplayLoaded) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _categoryInfo(state.products),
                      const SizedBox(
                        height: 5,
                      ),
                      _products(state.products),
                    ],
                  ),
                );
              } else if (state is LoadProductsDisplayFailure) {
                return const Center(
                  child: Text('Failed to load products'),
                );
              }
              return Container();
            },
          ),
        ));
  }

  Widget _categoryInfo(List<ProductEntity> products) {
    return Text(
      '${categoryEntity.title} (${products.length})',
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return Expanded(
      child: GridView.builder(
        itemCount: products.length,
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
