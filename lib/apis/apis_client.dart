import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  final String baseUrl;
  late final Dio dio;

  ApiClient(this.baseUrl) {
    dio = Dio()..options.baseUrl = baseUrl;
    if (!kReleaseMode) dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
}
