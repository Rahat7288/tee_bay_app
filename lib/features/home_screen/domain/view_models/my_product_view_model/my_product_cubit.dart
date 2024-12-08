import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository_impl/product_repository_impl.dart';
import 'my_product_state.dart';

class MyProductCubit extends Cubit<MyProductState> {
  MyProductCubit() : super(MyProductState());

  final _productRepoimpl = ProductRepositoryImpl();

  void getMyProduct({context, id}) {
    final Map header = {
      "Content-Type": "application/json",
    };
    emit(MyProductStateLoading());

    _productRepoimpl
        .getMyProduct(context: context, id: id, payload: header)
        .then((value) {
      if (value != null) {
        emit(MyProductStateLoaded(products: value));
      }
    }).onError((error, stackTrace) {
      emit(MyProductStateError(
          error: "my product fetch error : ${error.toString()}"));
    });
  }
}
