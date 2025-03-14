import 'package:e_commerce_project/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_project/core/configs/assets/app_vectors.dart';
import 'package:e_commerce_project/core/configs/theme/app_colors.dart';
import 'package:e_commerce_project/presentation/auth/pages/signin_page.dart';
import 'package:e_commerce_project/presentation/home/pages/home_page.dart';
import 'package:e_commerce_project/presentation/splash/bloc/splash_cubit.dart';
import 'package:e_commerce_project/presentation/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          AppNavigator.pushReplacement(context, SigninPage());
        }
        if (state is Authenticated) {
          AppNavigator.pushReplacement(context, const HomePage());
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Image.asset(
            color: AppColors.background,
            AppVectors.appLogo,
            scale: 1.4,
          ),
        ),
      ),
    );
  }
}
