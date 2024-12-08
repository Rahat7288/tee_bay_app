import 'package:equatable/equatable.dart';

import '../../../data/models/product_model.dart';

class MyProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MyProductStateLoading extends MyProductState {
  @override
  List<Object?> get props => [];
}

class MyProductStateLoaded extends MyProductState {
  final List<ProductModel>? products;

  MyProductStateLoaded({this.products});

  @override
  List<Object?> get props => [products];
}

class MyProductStateEmpty extends MyProductState {
  @override
  List<Object?> get props => [];
}

class MyProductStateError extends MyProductState {
  final String? error;
  MyProductStateError({this.error});
  @override
  List<Object?> get props => [error];
}
