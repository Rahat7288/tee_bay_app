import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tee_bay_app/features/create_product/domain/view_models/cubits/product_category_state.dart';

import '../../../data/models/product_categories_model.dart';
import '../../../data/repository_impl/product_category_repo_impl.dart';

class ProductCategoryCubit extends Cubit<ProductCategoryState> {
  ProductCategoryCubit() : super(const ProductCategoryState());

  final _categoryRepository = ProductCategoryRepoImpl();

  final List<ProductCategoriesModel> _productCategories = [];

  void getProductCategory({context}) {
    final Map header = {
      "Content-Type": "application/json",
    };

    _categoryRepository
        .getProductCategories(context: context, payload: header)
        .then((value) {
      _productCategories.add(value);

      emit(state.copyWith(categories: _productCategories));
    }).onError((error, stackTrace) {
      throw error.toString();
    });
  }
}
