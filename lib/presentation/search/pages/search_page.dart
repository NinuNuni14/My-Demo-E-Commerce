import 'package:e_commerce_project/common/bloc/products/products_display_cubit.dart';
import 'package:e_commerce_project/common/bloc/products/products_display_state.dart';
import 'package:e_commerce_project/common/widgets/appbar/basic_appbar.dart';
import 'package:e_commerce_project/common/widgets/product/product_card.dart';
import 'package:e_commerce_project/domain/product/entity/product_entity.dart';
import 'package:e_commerce_project/domain/product/usecases/get_product_by_title_usecase.dart';
import 'package:e_commerce_project/presentation/search/widgets/search_field.dart';
import 'package:e_commerce_project/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit =
            ProductsDisplayCubit(useCase: sl<GetProductByTitleUsecase>());
        // cubit.displayProducts(params: ""); // 👈 Ensure products are fetched
        return cubit;
      },
      child: Scaffold(
        appBar: BasicAppbar(height: 80, title: SearchField()),
        body: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
          builder: (context, state) {
            if (state is ProductsDisplayLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProductsDisplayLoaded) {
              return state.products.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [_noFound()],
                    )
                  : _products(state.products);
            }
            if (state is LoadProductsDisplayFailure) {
              return const Center(child: Text('Failed to load products'));
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _noFound() {
    return const Center(
      child: Column(
        children: [
          Icon(
            Icons.search_off_outlined,
            size: 80,
          ),
          SizedBox(height: 10),
          Text(
            'No products found',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
      ),
    );
  }
}
