import 'package:e_commerce_project/domain/order/usecases/get_orders_usecase.dart';
import 'package:e_commerce_project/presentation/setting/bloc/order_display_state.dart';
import 'package:e_commerce_project/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDisplayCubit extends Cubit<OrderDisplayState> {
  OrderDisplayCubit() : super(OrderDisplayLoading());

  void displayOrders() async {
    var returnedDate = await sl<GetOrdersUsecase>().call();

    returnedDate.fold((error) {
      emit(LoadOrderDisplayFailure(errorMessage: error));
    }, (data) {
      emit(OrderDisplayLoaded(orders: data));
    });
  }
}
