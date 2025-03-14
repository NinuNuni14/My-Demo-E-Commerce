import 'package:e_commerce_project/domain/category/entity/category_entity.dart';

abstract class CategoriesDisplayState {}

class CategoriesLoading extends CategoriesDisplayState {}

class CategoriesLoaded extends CategoriesDisplayState {
  final List<CategoryEntity> categories;

  CategoriesLoaded({required this.categories});
}

class LoadCategoryFailure extends CategoriesDisplayState {}
