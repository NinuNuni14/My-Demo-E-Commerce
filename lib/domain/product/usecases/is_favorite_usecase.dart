import 'package:e_commerce_project/core/usecase/usecase.dart';
import 'package:e_commerce_project/domain/product/repository/product.dart';
import 'package:e_commerce_project/service_locator.dart';

class IsFavoriteUsecase implements Usecase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await sl<ProductRepository>().isFavorite(params!);
  }
}
