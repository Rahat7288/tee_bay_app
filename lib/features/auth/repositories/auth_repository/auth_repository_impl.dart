import 'package:flutter/foundation.dart';
import 'package:tee_bay_app/core/data/networks/network_api_services.dart';
import 'package:tee_bay_app/resources/app_urls.dart';

import '../../../../core/data/networks/network_api_service_http.dart';
import '../../models/login_model/login_response_model.dart';
import '../../models/signup_model/signup_model.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final _apiService = NetworkApiServices();
  final _apiServiceHttp = NetworkApiServicesHttp();
  @override
  Future<LoginResponseModel> login({context, payload}) async {
    dynamic response =
        await _apiService.postApi(payload, AppUrls.signInUrl, context);
    // final response =
    //     await _apiServiceHttp.postApi(payload, AppUrls.signInUrl, context);
    if (kDebugMode) {
      print('login response: $response');
    }

    return LoginResponseModel.fromJson(response);
  }

  @override
  Future logout({context, payload}) {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<SignupModel> signup({context, payload}) async {
    dynamic response =
        await _apiService.postApi(payload, AppUrls.userRegister, context);

    if (kDebugMode) {
      print("signup response $response");
    }

    return SignupModel.fromJson(response);
  }
}
