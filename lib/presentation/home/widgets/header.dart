import 'package:e_commerce_project/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce_project/core/configs/assets/app_images.dart';
import 'package:e_commerce_project/core/configs/theme/app_colors.dart';
import 'package:e_commerce_project/domain/auth/entity/user_entity.dart';
import 'package:e_commerce_project/presentation/cart/pages/cart_page.dart';
import 'package:e_commerce_project/presentation/home/bloc/user_info_display_cubit.dart';
import 'package:e_commerce_project/presentation/home/bloc/user_info_display_state.dart';
import 'package:e_commerce_project/presentation/setting/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
        builder: (context, state) {
          if (state is UserInfoLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserInfoLoaded) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _profileImage(context, state.user),
                _gender(state.user),
                _cart(context)
              ],
            );
          }
          if (state is LoadUserInfoFailure) {
            return const AlertDialog(
              title: Text('Fail'),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _profileImage(BuildContext context, UserEntity user) {
    return GestureDetector(
      onTap: () => AppNavigator.push(context, const SettingPage()),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: user.image.isEmpty
                    ? const AssetImage(AppImages.profile)
                    : NetworkImage(user.image)),
            color: Colors.white,
            shape: BoxShape.circle),
      ),
    );
  }

  Widget _gender(UserEntity user) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          user.gender == 1 ? 'Men' : 'Women',
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ),
    );
  }

  Widget _cart(BuildContext context) {
    return GestureDetector(
      onTap: () => AppNavigator.push(context, const CartPage()),
      child: Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(Icons.shopping_bag),
        ),
      ),
    );
  }
}
