import 'package:flutter_bloc/flutter_bloc.dart';

import 'progress_state.dart';

class ProgressCubit extends Cubit<ProgressState> {
  ProgressCubit({required int totalSteps})
      : super(ProgressState(currentStep: 0, totalSteps: totalSteps));

  void nextStep() {
    if (state.currentStep < state.totalSteps - 1) {
      emit(ProgressState(
          currentStep: state.currentStep + 1, totalSteps: state.totalSteps));
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      emit(ProgressState(
          currentStep: state.currentStep - 1, totalSteps: state.totalSteps));
    }
  }
}
