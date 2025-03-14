import 'package:e_commerce_project/common/bloc/products/products_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchField extends StatelessWidget {
  SearchField({super.key});

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        if (controller.text.isEmpty) {
          context.read<ProductsDisplayCubit>().displayInitial();
        } else {
          context
              .read<ProductsDisplayCubit>()
              .displayProducts(params: controller.text);
        }
      },
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search'),
    );
  }
}
