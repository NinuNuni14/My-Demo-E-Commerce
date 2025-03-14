import 'package:e_commerce_project/common/bloc/categories/categories_display_cubit.dart';
import 'package:e_commerce_project/common/bloc/categories/categories_display_state.dart';
import 'package:e_commerce_project/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_project/common/widgets/appbar/basic_appbar.dart';
import 'package:e_commerce_project/core/configs/assets/app_images.dart';
import 'package:e_commerce_project/core/configs/theme/app_colors.dart';
import 'package:e_commerce_project/presentation/category_products/pages/category_product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: BlocProvider(
        create: (context) => CategoriesDisplayCubit()..displayCategories(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _shopByCategories(),
              const SizedBox(
                height: 20,
              ),
              Expanded(child: _categories()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _shopByCategories() {
    return const Text(
      'Shop by Categories',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
    );
  }

  Widget _categories() {
    return BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
        builder: (context, state) {
      if (state is CategoriesLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is LoadCategoryFailure) {
        return const Center(
          child: Text('Failed to load categories'),
        );
      } else if (state is CategoriesLoaded) {
        return ListView.separated(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => AppNavigator.push(
                    context,
                    CategoryProductPage(
                        categoryEntity: state.categories[index])),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.secondBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AppImages.categories +
                                    state.categories[index].image)),
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          state.categories[index].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
            itemCount: state.categories.length);
      }
      return Container();
    });
  }
}
