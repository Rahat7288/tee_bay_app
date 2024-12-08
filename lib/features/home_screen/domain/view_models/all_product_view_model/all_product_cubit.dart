import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository_impl/product_repository_impl.dart';
import 'all_product_state.dart';

class AllProductCubit extends Cubit<AllProductState> {
  AllProductCubit() : super(AllProductState());

  final _productRepoImple = ProductRepositoryImpl();

  void getAllProduct({context}) {
    emit(AllProductStateLoading());

    _productRepoImple.getProducts(context: context).then((value) {
      if (value != null) {
        debugPrint('All Product value\n $value');
        emit(AllProductStateLoaded(productModel: value));
      } else {
        emit(AllProductStateEmpty());
      }
    }).onError((error, stackTrace) {
      emit(AllProductStateError(
          errorMessage: "fetch error ${error.toString()}"));
    });
  }
}
