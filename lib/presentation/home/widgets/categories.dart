import 'package:e_commerce_project/common/bloc/categories/categories_display_state.dart';
import 'package:e_commerce_project/common/bloc/categories/categories_display_cubit.dart';
import 'package:e_commerce_project/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_project/core/configs/assets/app_images.dart';
import 'package:e_commerce_project/domain/category/entity/category_entity.dart';
import 'package:e_commerce_project/presentation/all_categories_page.dart/pages/all_categories_page.dart';
import 'package:e_commerce_project/presentation/category_products/pages/category_product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDisplayCubit()..displayCategories(),
      child: BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CategoriesLoaded) {
            return Column(
              children: [
                _seeAll(context),
                const SizedBox(
                  height: 20,
                ),
                _categories(state.categories)
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _seeAll(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Categories',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          GestureDetector(
            onTap: () => AppNavigator.push(context, const AllCategoriesPage()),
            child: const Text('See All',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget _categories(List<CategoryEntity> categories) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => AppNavigator.push(context,
                  CategoryProductPage(categoryEntity: categories[index])),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage((AppImages.categories +
                                categories[index].image)))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    categories[index].title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 14),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          itemCount: 5),
    );
  }
}
