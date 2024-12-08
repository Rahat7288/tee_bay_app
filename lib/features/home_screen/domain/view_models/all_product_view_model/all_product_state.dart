import 'package:equatable/equatable.dart';

import '../../../data/models/product_model.dart';

class AllProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AllProductStateLoading extends AllProductState {
  @override
  List<Object?> get props => [];
}

class AllProductStateLoaded extends AllProductState {
  final ProductModel? productModel;
  final String? errorMessage;

  AllProductStateLoaded({this.productModel, this.errorMessage});

  @override
  List<Object?> get props => [productModel, errorMessage];
}

class AllProductStateEmpty extends AllProductState {
  @override
  List<Object?> get props => [];
}

class AllProductStateError extends AllProductState {
  final String? errorMessage;
  AllProductStateError({this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
