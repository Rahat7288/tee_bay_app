import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tee_bay_app/services/utils/utils.dart';

import '../../../data/models/product_model2.dart';
import '../../../data/repository_impl/product_repository_impl.dart';
import 'my_product_state.dart';

class MyProductCubit extends Cubit<MyProductState> {
  MyProductCubit() : super(MyProductState());

  final _productRepoimpl = ProductRepositoryImpl();

  ///get  my products
  void getMyProduct({context, id}) {
    final Map header = {
      "Content-Type": "application/json",
    };

    final List<ProductModel2> myProducts = [];
    emit(MyProductStateLoading());

    _productRepoimpl
        .getMyProduct(context: context, id: id, payload: header)
        .then((value) {
      if (value != null) {
        myProducts.add(value);
        emit(MyProductStateLoaded(products: myProducts));
      }
    }).onError((error, stackTrace) {
      emit(MyProductStateError(
          error: "my product fetch error : ${error.toString()}"));
    });
  }

  ///update my product
  void updateMyProduct({context, id, data}) {
    final Map header = {
      "Content-Type": "application/json",
    };

    emit(MyProductStateLoading());
    _productRepoimpl
        .updateProduct(context: context, payload: data, header: header, id: id)
        .then((value) {
      if (value != null) {
        emit(MyProductStateLoaded(products: value));
      } else {
        emit(MyProductStateEmpty());
      }
    }).onError((error, stackTrace) {
      emit(MyProductStateError(
          error: "my product update error: ${error.toString()}"));
    });
  }

  ///delete my product
  void deleteMyProduct({context, id, data}) {
    final Map header = {
      "Content-Type": "application/json",
    };
    emit(MyProductStateLoading());

    _productRepoimpl
        .deleteProduct(context: context, payload: header, id: id)
        .then((value) {
      Utils.customSnackBar(context: context, snackText: 'Product deleted');
    }).onError((error, staackTrace) {
      emit(MyProductStateError(error: "product delete  ${error.toString()}"));
    });
  }
}
