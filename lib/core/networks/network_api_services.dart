import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tee_bay_app/core/networks/base_api_services.dart';

class NeTworkApiServices extends BasApiServices {
  static Future<BaseOptions> getBaseOptions(
      {Map<String, dynamic>? query}) async {
    BaseOptions options = BaseOptions(
        connectTimeout: const Duration(seconds: 10000),
        followRedirects: false,
        validateStatus: (status) {
          return status != 401 && status! < 550;
        },
        queryParameters: query,
        baseUrl: "",
        headers: {
          "Accept": "application/json",
          "Content-type": "application/json",
          "X-Requested-With": "XMLHttpRequest",
        });

    return options;
  }

  @override
  Future deleteApi(url, BuildContext context) {
    // TODO: implement deleteApi
    throw UnimplementedError();
  }

  @override
  Future getApi(String url, data, BuildContext context) {
    // TODO: implement getApi
    throw UnimplementedError();
  }

  @override
  Future postApi(payload, url, BuildContext context) {
    // TODO: implement postApi
    throw UnimplementedError();
  }

  @override
  Future updateApi(payload, url, BuildContext context) {
    // TODO: implement updateApi
    throw UnimplementedError();
  }
}
