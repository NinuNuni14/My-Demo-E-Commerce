import 'package:e_commerce_project/common/bloc/products/products_display_cubit.dart';
import 'package:e_commerce_project/common/bloc/products/products_display_state.dart';
import 'package:e_commerce_project/common/widgets/product/product_card.dart';
import 'package:e_commerce_project/domain/product/entity/product_entity.dart';
import 'package:e_commerce_project/domain/product/usecases/get_new_in_usecase.dart';
import 'package:e_commerce_project/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewIn extends StatelessWidget {
  const NewIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ProductsDisplayCubit(useCase: sl<GetNewInUsecase>())
          ..displayProducts();
      },
      child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
        builder: (context, state) {
          if (state is ProductsDisplayLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductsDisplayLoaded) {
            return Column(
              children: [
                _newIn(),
                const SizedBox(
                  height: 10,
                ),
                _product(state.products),
              ],
            );
          } else {
            return const Center(
              child: Text('Failed to load new in products'),
            );
          }
        },
      ),
    );
  }

  Widget _newIn() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text('New In',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    );
  }

  Widget _product(List<ProductEntity> products) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductCard(
              productEntity: products[index],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: products.length),
    );
  }
}
