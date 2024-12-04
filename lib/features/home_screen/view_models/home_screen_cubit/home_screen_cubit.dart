import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenState(myProduct: true));

  late bool myProduct;

  void toggleToMtProduct() {
    myProduct = true;
    emit(state.copyWith(myProduct: myProduct));
  }

  void toggleToAllProduct() {
    myProduct = false;
    emit(state.copyWith(myProduct: myProduct));
  }
}
