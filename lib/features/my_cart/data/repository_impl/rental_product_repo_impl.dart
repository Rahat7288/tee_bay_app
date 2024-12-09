import 'package:flutter/cupertino.dart';
import 'package:tee_bay_app/resources/app_urls.dart';

import '../../../../core/data/networks/network_api_service_http.dart';
import '../../domain/repositories/rental/rental_repository.dart';

class RentalProductRepoImpl implements RentRepository {
  final _networkService = NetworkApiServicesHttp();
  @override
  Future getRentalProducts({context, payload}) async {
    try {
      final response = await _networkService.getRequest(AppUrls.rentalPurchases,
          headers: payload, context: context);
      debugPrint(response.body);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
