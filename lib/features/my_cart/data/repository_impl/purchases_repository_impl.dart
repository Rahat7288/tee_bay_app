import 'package:flutter/cupertino.dart';
import 'package:tee_bay_app/resources/app_urls.dart';

import '../../../../core/data/networks/network_api_service_http.dart';
import '../../../home_screen/data/models/product_model.dart';
import '../../domain/repositories/purchases/purchases_repository.dart';

class PurchasesRepositoryImpl implements PurchasesRepository {
  final _networkApiServiceHttp = NetworkApiServicesHttp();
  @override
  Future deletePurchases({context, payload}) {
    // TODO: implement deletePurchases
    throw UnimplementedError();
  }

  @override
  Future<ProductModel> getPurchases({context, payload}) async {
    try {
      final response = await _networkApiServiceHttp.getRequest(
          AppUrls.transactionPurchases,
          context: context,
          headers: payload);
      debugPrint(response.body);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
