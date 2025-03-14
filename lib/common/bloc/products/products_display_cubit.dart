import 'package:e_commerce_project/common/bloc/products/products_display_state.dart';
import 'package:e_commerce_project/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  final Usecase useCase;
  ProductsDisplayCubit({required this.useCase})
      : super(ProductsDisplayInitial());

  void displayProducts({dynamic params}) async {
    emit(ProductsDisplayLoading());
    var returnedData = await useCase.call(params: params);
    return returnedData.fold((error) {
      emit(LoadProductsDisplayFailure());
    }, (data) {
      emit(ProductsDisplayLoaded(products: data));
    });
  }

  void displayInitial() {
    emit(ProductsDisplayInitial());
  }
}
