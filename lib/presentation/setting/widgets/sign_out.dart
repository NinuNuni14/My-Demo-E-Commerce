import 'package:e_commerce_project/common/bloc/button/button_state_cubit.dart';
import 'package:e_commerce_project/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_project/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce_project/domain/auth/usecase/signout_usecase.dart';
import 'package:e_commerce_project/presentation/auth/pages/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignOut extends StatelessWidget {
  const SignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        context.read<ButtonStateCubit>().execute(usecase: SignoutUsecase());
        AppNavigator.pushAndRemove(context, SigninPage());
      },
      content: const Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Expanded(child: SizedBox()),
        Text(
          'Sign Out',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        SizedBox(
          width: 20,
        ),
        Icon(
          Icons.logout,
          size: 40,
          color: Colors.white,
        )
      ]),
      color: false,
    );
  }
}
