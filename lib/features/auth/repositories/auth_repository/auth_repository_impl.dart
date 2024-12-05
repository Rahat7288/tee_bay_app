import 'package:flutter/foundation.dart';
import 'package:tee_bay_app/core/data/networks/network_api_services.dart';
import 'package:tee_bay_app/resources/app_urls.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final _apiService = NetworkApiServices();
  @override
  Future<dynamic> login({context, payload}) async {
    dynamic response =
        await _apiService.postApi(payload, AppUrls.signInUrl, context);
    if (kDebugMode) {
      print('login response: $response');
    }

    return response;
  }

  @override
  Future logout({context, payload}) {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
