import 'package:e_commerce_project/domain/auth/usecase/get_ages.dart';
import 'package:e_commerce_project/presentation/auth/bloc/age_display_state.dart';
import 'package:e_commerce_project/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgeDiaplayCubit extends Cubit<AgeDisplayState> {
  AgeDiaplayCubit() : super(AgesLoading());

  void displayAges() async {
    var returnedData = await sl<GetAgesUsecase>().call();

    returnedData.fold((message) {
      emit(AgesLoadFailure(message: message));
    }, (data) {
      emit(AgesLoaded(ages: data));
    });
  }
}
