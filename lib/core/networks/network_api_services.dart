import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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
  Future<dynamic> getApi(String url, data, BuildContext context) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    Dio dio = Dio(await getBaseOptions(query: data));

    dynamic responseJson;

    try {
      Response response = await dio.get(url, data: data);
      responseJson = returnResponse(response, context);
    } catch (e) {}

    return responseJson;
  }

  @override
  Future postApi(payload, url, BuildContext context) {
    // TODO: implement postApi
    throw UnimplementedError();
  }

  @override
  Future deleteApi(url, BuildContext context) {
    // TODO: implement deleteApi
    throw UnimplementedError();
  }

  @override
  Future updateApi(payload, url, BuildContext context) {
    // TODO: implement updateApi
    throw UnimplementedError();
  }

  dynamic returnResponse(Response response, context) async {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = response.data;
        return responseJson;
      case 201:
        dynamic responseJson = response.data;
        return responseJson;

      case 400:
        dynamic responseJson = response.data;
        return responseJson;

      case 500:
        dynamic responseJson = response.data;
        return responseJson;

      default:
    }
  }
}
