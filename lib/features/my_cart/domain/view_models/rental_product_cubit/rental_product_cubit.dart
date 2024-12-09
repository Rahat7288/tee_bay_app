import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tee_bay_app/features/my_cart/domain/view_models/rental_product_cubit/rental_product_state.dart';

import '../../../data/repository_impl/rental_product_repo_impl.dart';

class RentalProductCubit extends Cubit<RentalProductState> {
  RentalProductCubit() : super(RentalProductState());

  final _rentalProductRepository = RentalProductRepoImpl();

  void getRentalProductById({context}) {
    emit(RentalProductLoadingState());
    final Map header = {
      "Content-Type": "application/json",
    };
    _rentalProductRepository
        .getRentalProducts(context: context, payload: header)
        .then((value) {
      if (value != null) {
        emit(RentalProductSuccessState(products: value));
      } else {
        emit(RentalProductEmptyState());
      }
    }).onError((error, stackTrace) {
      emit(RentalProductFailureState(
          message: "product fetch error : ${error.toString()} "));
    });
  }
}
