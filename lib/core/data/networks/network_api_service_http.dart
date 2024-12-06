import 'dart:convert' as convert;

import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

import '../app_exceptions/app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServicesHttp extends BasApiServices {
  ///get request api ============
  @override
  Future<dynamic> getApi(String url, data, BuildContext context) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: data,
      );
      return returnResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  ///post request api ============
  @override
  Future<dynamic> postApi(payload, url, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: payload,
      );
      return returnResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  ///update request api ============

  @override
  Future<dynamic> updateApi(payload, url, BuildContext context) async {
    try {
      final response = await http.put(
        Uri.parse(url),
        body: payload,
      );
      return returnResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  ///delete request api ============
  @override
  Future<dynamic> deleteApi(url, payload, BuildContext context) async {
    try {
      final response = await http.delete(Uri.parse(url), headers: payload);
      return returnResponse(response);
    } catch (e) {
      rethrow;
    }
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
