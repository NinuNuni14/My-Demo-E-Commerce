import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/core/usecase/usecase.dart';
import 'package:e_commerce_project/domain/category/repository/category.dart';
import 'package:e_commerce_project/service_locator.dart';

class GetCategoriesUsecase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<CategoryRepository>().getCategories();
  }
}
