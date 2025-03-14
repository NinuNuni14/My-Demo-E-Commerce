import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/core/usecase/usecase.dart';
import 'package:e_commerce_project/domain/product/repository/product.dart';
import 'package:e_commerce_project/service_locator.dart';

class GetProductByTitleUsecase implements Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<ProductRepository>().getProductByTitle(params!);
  }
}
