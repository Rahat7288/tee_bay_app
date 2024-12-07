import 'package:flutter/foundation.dart';
import 'package:tee_bay_app/core/data/networks/network_api_service_http.dart';
import 'package:tee_bay_app/core/data/networks/network_api_services.dart';
import 'package:tee_bay_app/resources/app_urls.dart';

import 'create_product_repository.dart';

class CreteProductRepositoryImpl implements CreateProductRepository {
  final _apiService = NetworkApiServices();
  final _apiServiceHttp = NetworkApiServicesHttp();

  @override
  Future<dynamic> fetchProduct({context, payload}) async {
    try {
      final response =
          await _apiService.getApi(AppUrls.products, payload, context);

      if (kDebugMode) {
        print('Get response $response');
      }

      return _apiService.returnResponse(response, context);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> addProduct({context, payload}) async {
    try {
      final response =
          await _apiService.postApi(payload, AppUrls.products, context);
      if (kDebugMode) {
        print('Post response $response');
      }

      return _apiService.returnResponse(response, context);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> updateProduct({context, payload}) async {
    try {
      final response =
          await _apiService.updateApi(payload, AppUrls.products, context);
      if (kDebugMode) {
        print('Update response $response');
      }
      return _apiService.returnResponse(response, context);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> deleteProduct({context, payload}) async {
    try {
      final response =
          await _apiService.deleteApi(AppUrls.products, payload, context);
      if (kDebugMode) {
        print('Delete response $response');
      }
      return _apiService.returnResponse(response, context);
    } catch (e) {
      rethrow;
    }
  }
}
