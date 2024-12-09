import 'package:equatable/equatable.dart';

import '../../../../home_screen/data/models/product_model2.dart';

class PurchasesProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PurchasesProductLoadingState extends PurchasesProductState {
  @override
  List<Object?> get props => [];
}

class PurchasesProductSuccessState extends PurchasesProductState {
  final ProductModel2? product;
  PurchasesProductSuccessState({this.product});
  @override
  List<Object?> get props => [product];
}

class PurchasesProductEmptyState extends PurchasesProductState {
  @override
  List<Object?> get props => [];
}

class PurchasesProductErrorState extends PurchasesProductState {
  final String? error;

  PurchasesProductErrorState({this.error});

  @override
  List<Object?> get props => [error];
}
