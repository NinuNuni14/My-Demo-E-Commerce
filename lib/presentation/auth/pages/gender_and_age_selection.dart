import 'package:e_commerce_project/common/bloc/button/button_state.dart';
import 'package:e_commerce_project/common/bloc/button/button_state_cubit.dart';
import 'package:e_commerce_project/common/helper/bottomsheet/app_bottomsheet.dart';
import 'package:e_commerce_project/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_project/common/widgets/appbar/basic_appbar.dart';
import 'package:e_commerce_project/common/widgets/button/basic_reactive_button.dart';
import 'package:e_commerce_project/core/configs/theme/app_colors.dart';
import 'package:e_commerce_project/data/auth/models/user_creation_req.dart';
import 'package:e_commerce_project/domain/auth/usecase/signup_usecase.dart';
import 'package:e_commerce_project/presentation/auth/bloc/age_diaplay_cubit.dart';
import 'package:e_commerce_project/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:e_commerce_project/presentation/auth/bloc/gender_selection_cubit.dart';
import 'package:e_commerce_project/presentation/auth/pages/signin_page.dart';
import 'package:e_commerce_project/presentation/auth/widgets/ages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderAndAgeSelection extends StatelessWidget {
  final UserCreationReq userCreationReq;
  const GenderAndAgeSelection({super.key, required this.userCreationReq});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => GenderSelectionCubit()),
            BlocProvider(create: (context) => AgeSelectionCubit()),
            BlocProvider(create: (context) => AgeDiaplayCubit()),
            BlocProvider(create: (context) => ButtonStateCubit())
          ],
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonFailureState) {
                var snackbar = SnackBar(
                  content: Text(state.errorMessage),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              } else if (state is ButtonSuccessState) {
                var snackbar = SnackBar(
                  content: Text(state.successMessage),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                AppNavigator.push(context, SigninPage());
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 26, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _tellus(),
                      const SizedBox(
                        height: 30,
                      ),
                      _genders(context),
                      const SizedBox(
                        height: 30,
                      ),
                      howOld(),
                      const SizedBox(
                        height: 30,
                      ),
                      _age(),
                    ],
                  ),
                ),
                _finishButton(context)
              ],
            ),
          )),
    );
  }

  Widget _tellus() {
    return const Text(
      'Tell us about Yourself',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
    );
  }

  Widget _genders(BuildContext context) {
    return BlocBuilder<GenderSelectionCubit, int>(builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          genderTile(context, 1, 'Male'),
          const SizedBox(
            width: 20,
          ),
          genderTile(context, 2, 'Female'),
          const SizedBox(
            width: 20,
          ),
          genderTile(context, 3, 'LGBTQ+')
        ],
      );
    });
  }

  Widget genderTile(BuildContext context, int genderIndex, String gender) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          context.read<GenderSelectionCubit>().selectGender(genderIndex);
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: context.read<GenderSelectionCubit>().selectedIndex ==
                      genderIndex
                  ? AppColors.primary
                  : AppColors.secondBackground,
              borderRadius: BorderRadius.circular(30)),
          child: Center(
            child: Text(
              gender,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  Widget howOld() {
    return const Text(
      'How old are you?',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }

  Widget _age() {
    return BlocBuilder<AgeSelectionCubit, String>(builder: (context, state) {
      return GestureDetector(
        onTap: () {
          AppBottomsheet.display(
              context,
              MultiBlocProvider(providers: [
                BlocProvider.value(
                  value: context.read<AgeSelectionCubit>(),
                ),
                BlocProvider.value(
                    value: context.read<AgeDiaplayCubit>()..displayAges()),
              ], child: const Ages()));
        },
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.secondBackground,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(state), const Icon(Icons.keyboard_arrow_down)],
          ),
        ),
      );
    });
  }

  Widget _finishButton(BuildContext context) {
    return Container(
      height: 100,
      color: AppColors.secondBackground,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Builder(builder: (context) {
          return BasicReactiveButton(
            onPressed: () {
              userCreationReq.gender =
                  context.read<GenderSelectionCubit>().selectedIndex;
              userCreationReq.age =
                  context.read<AgeSelectionCubit>().selectedAge;
              context
                  .read<ButtonStateCubit>()
                  .execute(usecase: SignupUsecase(), params: userCreationReq);
            },
            title: 'Finish',
          );
        }),
      ),
    );
  }
}
