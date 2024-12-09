import 'package:flutter/cupertino.dart';
import 'package:tee_bay_app/resources/app_urls.dart';

import '../../../../core/data/networks/network_api_service_http.dart';
import '../../domain/repositories/products_repository.dart';
import '../models/product_model.dart';
import '../models/product_model2.dart';

class ProductRepositoryImpl implements ProducRepository {
  final _networkService = NetworkApiServicesHttp();

  @override
  Future deleteProduct({context, payload, id}) async {
    try {
      final response = await _networkService.deleteRequest(AppUrls.products,
          headers: payload);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductModel2> getProducts({context, payload}) async {
    final List<ProductModel> _products = [];
    try {
      final response =
          await _networkService.getRequest(AppUrls.products, headers: payload);

      debugPrint('all product response $response');

      return ProductModel2.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  ///helps user to upload a product================
  @override
  Future postProduct({context, payload, header}) async {
    try {
      final response = await _networkService.postRequest(AppUrls.products,
          headers: header, body: payload);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  ///helps user to update own products ===============
  @override
  Future updateProduct({context, payload, header, id}) async {
    try {
      final response = await _networkService.putRequest(AppUrls.products,
          headers: header, body: payload);
      debugPrint("put response  product $response");

      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductModel2> getMyProduct({context, payload, id}) async {
    try {
      final response = await _networkService.deleteRequest(AppUrls.products,
          headers: payload);
      return ProductModel2.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
