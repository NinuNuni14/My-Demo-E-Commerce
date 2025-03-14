import 'package:e_commerce_project/domain/order/entity/order_entity.dart';

abstract class OrderDisplayState {}

class OrderDisplayLoading extends OrderDisplayState {}

class OrderDisplayLoaded extends OrderDisplayState {
  final List<OrderEntity> orders;

  OrderDisplayLoaded({required this.orders});
}

class LoadOrderDisplayFailure extends OrderDisplayState {
  final String errorMessage;

  LoadOrderDisplayFailure({required this.errorMessage});
}
