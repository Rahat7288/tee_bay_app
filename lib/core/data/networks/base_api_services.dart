import 'package:flutter/material.dart';

abstract class BasApiServices {
  Future<dynamic> getApi(String url, dynamic data, BuildContext context);
  Future<dynamic> postApi(payload, url, BuildContext context);
  Future<dynamic> updateApi(payload, url, BuildContext context);
  Future<dynamic> deleteApi(url, payload, BuildContext context);
}
