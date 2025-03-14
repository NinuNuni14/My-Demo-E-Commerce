import 'package:e_commerce_project/common/bloc/button/button_state.dart';
import 'package:e_commerce_project/common/bloc/button/button_state_cubit.dart';
import 'package:e_commerce_project/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_project/common/widgets/appbar/basic_appbar.dart';
import 'package:e_commerce_project/common/widgets/button/basic_reactive_button.dart';
import 'package:e_commerce_project/data/auth/models/user_signin_req.dart';
import 'package:e_commerce_project/domain/auth/usecase/signin_usecase.dart';
import 'package:e_commerce_project/presentation/auth/pages/forgot_password_page.dart';
import 'package:e_commerce_project/presentation/auth/pages/signup_page.dart';
import 'package:e_commerce_project/presentation/home/pages/home_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: BlocProvider(
            create: (context) => ButtonStateCubit(),
            child: BlocListener<ButtonStateCubit, ButtonState>(
              listener: (context, state) {
                if (state is ButtonFailureState) {
                  var snackbar = SnackBar(
                    content: Text(state.errorMessage),
                    behavior: SnackBarBehavior.floating,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                } else if (state is ButtonSuccessState) {
                  AppNavigator.pushAndRemove(context, const HomePage());
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _signinText(context),
                  const SizedBox(
                    height: 20,
                  ),
                  _emailField(context),
                  const SizedBox(
                    height: 20,
                  ),
                  _passwordField(context),
                  const SizedBox(
                    height: 20,
                  ),
                  _forgotPassword(context),
                  const SizedBox(
                    height: 20,
                  ),
                  _continueButton(context),
                  const SizedBox(
                    height: 20,
                  ),
                  _createAccount(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return const Text(
      'Sign in',
      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(hintText: 'Enter Email'),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(hintText: 'Enter Password'),
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(builder: (context) {
      return BasicReactiveButton(
        onPressed: () {
          final userSigninReq = UserSigninReq(
            email: _emailCon.text,
            password: _passwordCon.text,
          );
          context
              .read<ButtonStateCubit>()
              .execute(usecase: SigninUsecase(), params: userSigninReq);
        },
        title: "Continue",
      );
    });
  }

  Widget _forgotPassword(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RichText(
          text: TextSpan(children: [
            const TextSpan(text: 'Forgot password?  '),
            TextSpan(
                text: 'Reset',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigator.push(context, ForgotPasswordPage());
                  },
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ]),
        ),
      ],
    );
  }

  Widget _createAccount(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Center(
          child: RichText(
            text: TextSpan(children: [
              const TextSpan(text: 'Do you have an account?  '),
              TextSpan(
                  text: 'Sign up',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      AppNavigator.push(context, SignupPage());
                    },
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ]),
          ),
        ),
      ],
    );
  }
}
