import 'package:dartz/dartz.dart';
import 'package:e_commerce_project/common/bloc/button/button_state.dart';
import 'package:e_commerce_project/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  Future<void> execute({dynamic params, required Usecase usecase}) async {
    emit(ButtonLoadingState());
    try {
      Either returnedData = await usecase.call(params: params);

      returnedData.fold((error) {
        emit(ButtonFailureState(errorMessage: error.toString()));
      }, (data) {
        emit(ButtonSuccessState(
            successMessage: 'Create an Account Successfully'));
      });
    } catch (e) {
      emit(ButtonFailureState(errorMessage: e.toString()));
    }
  }
}
