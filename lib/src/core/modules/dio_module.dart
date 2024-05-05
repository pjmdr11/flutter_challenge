import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_challenge/src/core/constants/api_constants.dart';
import 'package:flutter_challenge/src/core/constants/env_constants.dart';
import 'package:flutter_challenge/src/core/constants/mock_responses.dart';
import 'package:flutter_challenge/src/data/source/local/env_helper.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @prod
  @dev
  @lazySingleton
  Dio dio(EnvHelper envHelper) {
    const defTimeout = 50;
    const defReceiveTimeOut = 50;
    final String baseurl = envHelper.getEnvData(envBaseApi);
    final dio = Dio()
      ..options.baseUrl = baseurl
      ..options.connectTimeout = const Duration(seconds: defTimeout)
      ..options.receiveTimeout = const Duration(seconds: defReceiveTimeOut);
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      options.headers["User-Agent"] =
          "com.stagingcupid.api/10.16.6 (Release) Android/31";
      options.headers["x-api-key"] = envHelper.getEnvData(envApiToken);
      return handler.next(options);
    }));
    if (kDebugMode) {
      dio.interceptors.add(CurlLoggerDioInterceptor(
          convertFormData: true, printOnSuccess: true));
      dio.interceptors.add(PrettyDioLogger(
          requestBody: kDebugMode,
          error: kDebugMode,
          requestHeader: kDebugMode,
          responseHeader: kDebugMode,
          responseBody: kDebugMode));
    }

    return dio;
  }

  @test
  @lazySingleton
  Dio getMockDio(EnvHelper envHelper) {
    const defTimeout = 10;
    const defReceiveTimeOut = 10;
    final String baseurl = envHelper.getEnvData(envBaseApi);

    final dio = Dio()
      ..options.baseUrl = baseurl
      ..options.connectTimeout = const Duration(seconds: defTimeout)
      ..options.receiveTimeout = const Duration(seconds: defReceiveTimeOut);

    dio.interceptors.add(CurlLoggerDioInterceptor(
      convertFormData: true,
    ));
    dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        error: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true));

    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      options.headers["User-Agent"] =
          "com.stagingcupid.api/10.16.6 (Release) Android/31";
      options.headers["x-api-key"] = "test_token";
      return handler.next(options);
    }));
    setupAdapter(dio);
    return dio;
  }

  @lazySingleton
  DioAdapter setupAdapter(Dio dio) {
    final DioAdapter adapter =
        DioAdapter(dio: dio, matcher: const FullHttpRequestMatcher())
          ..onGet("/countries", (server) {
            return server.reply(200, countryMockResponse,
                isRedirect: true, delay: const Duration(seconds: 1));
          }, headers: {}, queryParameters: {}, data: null);

    return adapter;
  }
}
