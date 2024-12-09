import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tee_bay_app/features/my_cart/domain/view_models/purchases_product_cubit/purchase_product_state.dart';

import '../../../data/repository_impl/purchases_repository_impl.dart';

class PurchasesProductCubit extends Cubit<PurchasesProductState> {
  PurchasesProductCubit() : super(PurchasesProductState());

  final _purchasesRepository = PurchasesRepositoryImpl();

  void getPurchasesProducts({context}) {
    emit(PurchasesProductLoadingState());
    final Map header = {
      "Content-Type": "application/json",
    };

    _purchasesRepository
        .getPurchases(context: context, payload: header)
        .then((value) {
      if (value != null) {
        emit(PurchasesProductSuccessState(product: value));
      } else {
        emit(PurchasesProductEmptyState());
      }
    }).onError((error, stackTreace) {
      emit(PurchasesProductErrorState(
          error: "product fetch  error: ${error.toString()} "));
    });
  }
}
