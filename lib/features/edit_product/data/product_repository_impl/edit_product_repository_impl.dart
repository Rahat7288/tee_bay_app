import 'package:flutter/cupertino.dart';
import 'package:tee_bay_app/resources/app_urls.dart';

import '../../../../core/data/networks/network_api_service_http.dart';
import '../../../home_screen/data/models/product_model2.dart';
import '../../domain/repository/edit_product_repository.dart';

class EditProductRepoImple implements EditProductRepository {
  final _networkService = NetworkApiServicesHttp();
  @override
  Future<ProductModel2> editProduct({context, payload, header, id}) async {
    try {
      final response = await _networkService.putRequest(
          AppUrls.updateProduct(id),
          context: context,
          headers: header,
          body: payload);

      debugPrint("update product response $response");

      return ProductModel2.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
