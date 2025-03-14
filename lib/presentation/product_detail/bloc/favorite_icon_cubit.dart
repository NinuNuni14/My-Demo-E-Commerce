import 'package:e_commerce_project/domain/product/entity/product_entity.dart';
import 'package:e_commerce_project/domain/product/usecases/add_or_remove_favorite_product_usecase.dart';
import 'package:e_commerce_project/domain/product/usecases/is_favorite_usecase.dart';
import 'package:e_commerce_project/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteIconCubit extends Cubit<bool> {
  FavoriteIconCubit() : super(false);

  void isFavorite(String productId) async {
    var result = await sl<IsFavoriteUsecase>().call(params: productId);
    emit(result);
  }

  void onTap(ProductEntity product) async {
    var result =
        await sl<AddOrRemoveFavoriteProductUsecase>().call(params: product);
    result.fold((error) {
      emit(error);
    }, (data) {
      emit(data);
    });
  }
}
