import 'package:e_commerce_project/common/bloc/button/button_state_cubit.dart';
import 'package:e_commerce_project/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_project/common/widgets/appbar/basic_appbar.dart';
import 'package:e_commerce_project/presentation/setting/pages/my_favorite_page.dart';
import 'package:e_commerce_project/presentation/setting/pages/my_order.dart';
import 'package:e_commerce_project/presentation/setting/widgets/my_tile.dart';
import 'package:e_commerce_project/presentation/setting/widgets/sign_out.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonStateCubit(),
      child: Scaffold(
        appBar: const BasicAppbar(
          title: Text('Setting'),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                MyTile(
                  text: 'My Favorite',
                  onTap: () {
                    AppNavigator.push(context, const MyFavoritePage());
                  },
                ),
                MyTile(
                  text: 'My Orders',
                  onTap: () {
                    AppNavigator.push(context, const MyOrder());
                  },
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10, right: 10),
              child: Align(alignment: Alignment.bottomRight, child: SignOut()),
            )
          ],
        ),
      ),
    );
  }
}
