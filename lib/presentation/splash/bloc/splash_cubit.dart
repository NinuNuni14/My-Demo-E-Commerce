import 'package:e_commerce_project/domain/auth/usecase/is_logged_in_usecase.dart';
import 'package:e_commerce_project/presentation/splash/bloc/splash_state.dart';
import 'package:e_commerce_project/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));

    var isLoggedIn = await sl<IsLoggedInUsecase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
