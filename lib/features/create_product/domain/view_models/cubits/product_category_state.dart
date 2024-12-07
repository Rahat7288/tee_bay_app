import 'package:equatable/equatable.dart';

import '../../../data/models/product_categories_model.dart';

class ProductCategoryState extends Equatable {
  final List<ProductCategoriesModel>? categories;
  const ProductCategoryState({this.categories});
  @override
  List<Object> get props => [categories ?? []];

  ProductCategoryState copyWith({
    List<ProductCategoriesModel>? categories,
  }) {
    return ProductCategoryState(
      categories: categories ?? this.categories,
    );
  }
}
