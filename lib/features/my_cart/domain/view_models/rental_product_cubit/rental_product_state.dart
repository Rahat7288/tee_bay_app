import 'package:equatable/equatable.dart';

import '../../../../home_screen/data/models/product_model2.dart';

class RentalProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RentalProductLoadingState extends RentalProductState {
  @override
  List<Object?> get props => [];
}

class RentalProductSuccessState extends RentalProductState {
  final ProductModel2? products;
  RentalProductSuccessState({this.products});
  @override
  List<Object?> get props => [];
}

class RentalProductEmptyState extends RentalProductState {
  @override
  List<Object?> get props => [];
}

class RentalProductFailureState extends RentalProductState {
  final String message;
  RentalProductFailureState({required this.message});
  @override
  List<Object?> get props => [message];
}
