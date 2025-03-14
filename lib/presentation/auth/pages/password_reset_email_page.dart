import 'package:e_commerce_project/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_project/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce_project/core/configs/assets/app_vectors.dart';
import 'package:e_commerce_project/core/configs/theme/app_colors.dart';
import 'package:e_commerce_project/presentation/auth/pages/signin_page.dart';
import 'package:flutter/material.dart';

class PasswordResetEmailPage extends StatelessWidget {
  const PasswordResetEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _emailSending(),
          const SizedBox(
            height: 30,
          ),
          _sendEmail(),
          const SizedBox(
            height: 30,
          ),
          _returnToLoginButton(context),
        ],
      ),
    );
  }

  Widget _emailSending() {
    return Center(
      child: Image.asset(
        AppVectors.emailSending,
        scale: 2.5,
        color: AppColors.primary,
      ),
    );
  }

  Widget _sendEmail() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          'We send you an Email to reset your password',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget _returnToLoginButton(BuildContext context) {
    return BasicAppButton(
        onPressed: () {
          AppNavigator.pushReplacement(context, SigninPage());
        },
        width: 200,
        title: 'Return to Login');
  }
}
