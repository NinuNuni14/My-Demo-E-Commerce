import 'package:e_commerce_project/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_project/common/widgets/appbar/basic_appbar.dart';
import 'package:e_commerce_project/core/configs/theme/app_colors.dart';
import 'package:e_commerce_project/domain/order/entity/order_entity.dart';
import 'package:e_commerce_project/presentation/setting/pages/order_items_page.dart';
import 'package:flutter/material.dart';

class OrderDetailPage extends StatelessWidget {
  final OrderEntity orderEntity;
  const OrderDetailPage({super.key, required this.orderEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: Text('Order #${orderEntity.code}'),
      ),
      body: Column(
        children: [
          _orderStatus(),
          const SizedBox(
            height: 10,
          ),
          _items(context),
          const SizedBox(
            height: 10,
          ),
          _shippingDetail(),
        ],
      ),
    );
  }

  Widget _orderStatus() {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            height: 70,
            decoration: const BoxDecoration(color: AppColors.background),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: orderEntity.orderStatus[index].done == true
                              ? Colors.grey
                              : AppColors.primary),
                      child: Center(
                        child: orderEntity.orderStatus[index].done == true
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 20,
                              )
                            : const Text(''),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      orderEntity.orderStatus[index].title,
                      style: TextStyle(
                          color: orderEntity.orderStatus[index].done == true
                              ? Colors.grey
                              : Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 20),
                    )
                  ],
                ),
                Text(
                  orderEntity.orderStatus[index].createdDate
                      .toDate()
                      .toString()
                      .split(' ')[0],
                  style: TextStyle(
                    color: orderEntity.orderStatus[index].done == true
                        ? Colors.grey
                        : Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: orderEntity.orderStatus.length);
  }

  Widget _items(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Items',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('${orderEntity.products.length} items',
                        style: const TextStyle(color: Colors.white))
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    return AppNavigator.push(context,
                        OrderItemsPage(products: orderEntity.products));
                  },
                  child: const Text(
                    'View All',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _shippingDetail() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Shipping Detail',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.secondBackground,
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              orderEntity.shippingAddress,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
