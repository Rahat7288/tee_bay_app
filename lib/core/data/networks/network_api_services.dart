import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../app_exceptions/app_exceptions.dart';
import 'base_api_services.dart';

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
    } on SocketException {
      throw InternetException();
    } catch (e) {
      throw 'Post APi error : ${e.toString()}';
    }

    return responseJson;
  }

  @override
  Future<dynamic> postApi(payload, url, BuildContext context) async {
    if (kDebugMode) {
      print(url);
      print("payload: $payload");
    }
    Dio dio = Dio(await getBaseOptions(query: payload));
    dynamic responseJson;
    try {
      final response = await dio.post(url, data: payload);

      responseJson = returnResponse(response, context);
    } catch (e) {
      throw 'Post APi error : ${e.toString()}';
    }
    return responseJson;
  }

  @override
  Future deleteApi(url, BuildContext context) async {
    if (kDebugMode) {
      print(url);
    }

    Dio dio = Dio(await getBaseOptions());

    dynamic responseJson;

    try {
      final response = await dio.delete(url);
      responseJson = returnResponse(response, context);
    } catch (e) {
      throw 'Delete APi error : ${e.toString()}';
    }

    return responseJson;
  }

  @override
  Future updateApi(payload, url, BuildContext context) async {
    if (kDebugMode) {
      print(url);
      print(payload);
    }
    Dio dio = Dio(await getBaseOptions(query: payload));
    dynamic responseJson;

    try {
      final response = await dio.put(url, data: payload);
      responseJson = returnResponse(response, context);
    } catch (e) {
      throw 'Update APi error : ${e.toString()}';
    }
    return responseJson;
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
        throw FetchDataException(
            'Error while communicating with server ${response.statusCode.toString()}');
    }
  }
}
