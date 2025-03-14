import 'package:e_commerce_project/common/bloc/categories/categories_display_state.dart';
import 'package:e_commerce_project/domain/category/usecase/get_categories_usecase.dart';
import 'package:e_commerce_project/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {
  CategoriesDisplayCubit() : super(CategoriesLoading());

  void displayCategories() async {
    var returnedData = await sl<GetCategoriesUsecase>().call();

    returnedData.fold((error) {
      emit(LoadCategoryFailure());
    }, (data) {
      emit(CategoriesLoaded(categories: data));
    });
  }
}
