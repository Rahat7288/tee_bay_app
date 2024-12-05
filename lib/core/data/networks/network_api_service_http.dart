import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

import '../app_exceptions/app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServicesHttp extends BasApiServices {
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
  Future<http.Response> postApi(payload, url, BuildContext context) async {
    if (kDebugMode) {
      print('post api statuscode $payload');
      print('url $url');
    }

    http.Response response;
    try {
      response = await http.post(Uri.parse(url), body: payload);
      if (kDebugMode) {
        print('response ${response.statusCode}');
      }
    } catch (e) {
      throw e.toString();
    }
    return response;
  }

  @override
  Future updateApi(payload, url, BuildContext context) {
    // TODO: implement updateApi
    throw UnimplementedError();
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200 || 201 || 202:
        return convert.jsonDecode(response.body);
      case 400 || 401 || 402 || 403 || 404:
        throw InvalidUrlException();
      case 500:
        throw ServerException();
      default:
        throw FetchDataException(
            'Error while communication with server status code: ${response.statusCode}');
    }
  }
}
