import 'package:e_commerce_project/presentation/home/widgets/categories.dart';
import 'package:e_commerce_project/presentation/home/widgets/header.dart';
import 'package:e_commerce_project/presentation/home/widgets/new_in.dart';
import 'package:e_commerce_project/presentation/home/widgets/search_field_widget.dart';
import 'package:e_commerce_project/presentation/home/widgets/top_selling.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            children: [
              Header(),
              SizedBox(
                height: 40,
              ),
              SearchFieldWidget(),
              SizedBox(
                height: 40,
              ),
              Categories(),
              SizedBox(
                height: 40,
              ),
              TopSelling(),
              SizedBox(
                height: 40,
              ),
              NewIn(),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
