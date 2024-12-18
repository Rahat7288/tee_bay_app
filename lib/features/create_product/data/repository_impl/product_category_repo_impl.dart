import 'package:flutter/foundation.dart';
import 'package:tee_bay_app/resources/app_urls.dart';

import '../../../../core/data/networks/network_api_service_http.dart';
import '../../domain/repositories/product_category_repo.dart';
import '../models/product_categories_model.dart';

class ProductCategoryRepoImpl extends ProductCategoryRepo {
  final _networkServiceHttp = NetworkApiServicesHttp();

  Future<ProductCategoriesModel> getProductCategory({
    context,
    payload,
  }) async {
    try {
      final response = await _networkServiceHttp.getRequest(
        AppUrls.productCategories,
        headers: payload,
      );
      if (kDebugMode) {
        print('category response $response');
      }
      return ProductCategoriesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
