import 'dart:async';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../core/locator/locator.dart';
import 'data_source/api_utils.dart';

class ApiClient {
  static Future<void> provideDio() async {
    final dio = await setupDio();
    locator.registerSingleton(dio);
    locator.registerSingleton(PostApi(dio));
  }

  static FutureOr<Dio> setupDio() async {
    final dio = Dio();
    dio.options = BaseOptions(
      baseUrl: "https://foodmanandws.isni.co",
      responseType: ResponseType.plain,
      headers: {
        'Content-Type': 'application/json',
        'contentType': 'application/json',
        'responseType': 'text/plain',
      },
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
    );
    dio.interceptors.add(PrettyDioLogger(
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true));

    return dio;
  }
}
