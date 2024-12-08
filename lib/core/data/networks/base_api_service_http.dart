import 'package:flutter/cupertino.dart';

abstract class BaseNetworkService {
  Future<dynamic> getRequest(String url,
      {Map<String, String>? headers, BuildContext? context});
  Future<dynamic> postRequest(String url,
      {Map<String, String>? headers,
      Map<String, dynamic>? body,
      BuildContext? context});
  Future<dynamic> putRequest(String url,
      {Map<String, String>? headers,
      Map<String, dynamic>? body,
      BuildContext? context});
  Future<dynamic> deleteRequest(String url,
      {Map<String, String>? headers, BuildContext? context});
}
