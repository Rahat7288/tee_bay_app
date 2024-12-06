import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:tee_bay_app/core/data/networks/network_api_service_http.dart';

void main() {
  late NetworkApiServicesHttp networkService;

  setUp(() {
    networkService = NetworkApiServicesHttp();
  });

  test('GET request should return expected data', () async {
    final mockClient = MockClient((request) async {
      return http.Response(jsonEncode({'message': 'Success'}), 200);
    });
    final data = await networkService.getRequest('http://127.0.0.1:8000/',
        headers: {'Content-Type': 'application/json'});
    expect(data['message'], 'Success');
  });

  test('POST request should return expected data', () async {
    final mockClient = MockClient((request) async {
      return http.Response(jsonEncode({'id': 1, 'message': 'Created'}), 201);
    });
    final data = await networkService.postRequest('http://127.0.0.1:8000/',
        headers: {'Content-Type': 'application/json'}, body: {'name': 'Test'});
    expect(data['message'], 'Created');
  });

  test('PUT request should return expected data', () async {
    final mockClient = MockClient((request) async {
      return http.Response(jsonEncode({'message': 'Updated'}), 200);
    });
    final data = await networkService.putRequest('http://127.0.0.1:8000/',
        headers: {'Content-Type': 'application/json'}, body: {'name': 'Test'});
    expect(data['message'], 'Updated');
  });

  test('DELETE request should return expected data', () async {
    final mockClient = MockClient((request) async {
      return http.Response(jsonEncode({'message': 'Deleted'}), 200);
    });
    final data = await networkService.deleteRequest('http://127.0.0.1:8000/',
        headers: {'Content-Type': 'application/json'});
    expect(data['message'], 'Deleted');
  });
}
