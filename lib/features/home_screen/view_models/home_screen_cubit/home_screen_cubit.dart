import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenState(myProduct: true));

  ///helps to manage home screen state
  ///default screen state is all product list
  ///

  late bool myProduct;

  void toggleToMyProduct() {
    myProduct = true;
    emit(state.copyWith(myProduct: myProduct));
  }

  void toggleToAllProduct() {
    myProduct = false;
    emit(state.copyWith(myProduct: myProduct));
  }
}
