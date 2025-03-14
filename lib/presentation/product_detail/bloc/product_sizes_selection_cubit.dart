import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSizesSelectionCubit extends Cubit<int> {
  ProductSizesSelectionCubit() : super(0);

  int selectedIndex = 0;

  void selectSize(int index) {
    selectedIndex = index;
    emit(index);
  }
}
