import 'package:tee_bay_app/core/data/networks/network_api_service_http.dart';
import 'package:tee_bay_app/core/data/networks/network_api_services.dart';
import 'package:tee_bay_app/resources/app_urls.dart';

import 'create_product_repository.dart';

class CreteProductRepositoryImpl implements CreateProductRepository {
  final _apiService = NetworkApiServices();
  final _apiServiceHttp = NetworkApiServicesHttp();
  @override
  Future<dynamic> addProduct({context, payload}) async {
    final response =
        await _apiService.postApi(payload, AppUrls.baseUrl, context);

    return _apiService.returnResponse(response, context);
  }
}
