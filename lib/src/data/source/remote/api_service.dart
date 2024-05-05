import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_challenge/src/data/models/api_request_model.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiService {
  final Dio dio;
  ApiService({required this.dio});

  Future<dynamic> request({required ApiRequestModel model}) async {
    try {
      final response = await dio.request(
        model.url,
        data: model.body,
        queryParameters: model.query,
        options: Options(headers: model.headers, method: model.method),
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
