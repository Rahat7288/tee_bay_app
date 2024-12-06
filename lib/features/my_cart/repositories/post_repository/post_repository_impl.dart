import 'package:flutter/foundation.dart';
import 'package:tee_bay_app/features/my_cart/repositories/post_repository/post_repository.dart';
import 'package:tee_bay_app/resources/app_urls.dart';

import '../../../../core/data/networks/network_api_services.dart';

class PostRepositoryImpl implements PostRepository {
  final _networkService = NetworkApiServices();
  @override
  Future delete({context, payload}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getPost({context, payload}) async {
    try {
      final response =
          await _networkService.getApi(AppUrls.testApi, payload, context);
      if (kDebugMode) {
        print("test post response $response");
      }
      return response;
    } catch (e) {
      rethrow;
    }
    throw UnimplementedError();
  }

  @override
  Future postPost({context, payload}) {
    // TODO: implement postPost
    throw UnimplementedError();
  }

  @override
  Future updatePost({context, payload}) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
