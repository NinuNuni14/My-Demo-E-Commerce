import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/core/usecase/usecase.dart';
import 'package:e_commerce_project/domain/product/repository/product.dart';
import 'package:e_commerce_project/service_locator.dart';

class GetTopSellingUsecase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<ProductRepository>().getTopSelling();
  }
}
