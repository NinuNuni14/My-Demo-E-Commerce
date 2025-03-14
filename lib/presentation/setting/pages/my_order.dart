import 'package:e_commerce_project/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_project/common/widgets/appbar/basic_appbar.dart';
import 'package:e_commerce_project/core/configs/theme/app_colors.dart';
import 'package:e_commerce_project/domain/order/entity/order_entity.dart';
import 'package:e_commerce_project/presentation/setting/bloc/order_display_cubit.dart';
import 'package:e_commerce_project/presentation/setting/bloc/order_display_state.dart';
import 'package:e_commerce_project/presentation/setting/pages/order_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('My Orders'),
      ),
      body: BlocProvider(
        create: (context) => OrderDisplayCubit()..displayOrders(),
        child: BlocListener<OrderDisplayCubit, OrderDisplayState>(
          listener: (context, state) {
            if (state is LoadOrderDisplayFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
          child: BlocBuilder<OrderDisplayCubit, OrderDisplayState>(
            builder: (context, state) {
              if (state is OrderDisplayLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is OrderDisplayLoaded) {
                return _orders(context, state.orders);
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Widget _orders(BuildContext context, List<OrderEntity> orders) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => AppNavigator.push(
                context, OrderDetailPage(orderEntity: orders[index])),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(10),
              height: 75,
              decoration: BoxDecoration(
                  color: AppColors.secondBackground,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.receipt,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Oder #${orders[index].code}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 17),
                          ),
                          Text('${orders[index].products.length} items')
                        ],
                      )
                    ],
                  ),
                  const Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: orders.length);
  }
}
