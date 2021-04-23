
import 'package:dio/dio.dart';

Dio _createDio() {
  final dio = Dio(BaseOptions(
    baseUrl: "https://private-5907a-psmocktest.apiary-mock.com/",
  ));
  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    responseBody: true,
  ));
  return dio;
}

class ApiClient {
  static Dio _dio;

  static Dio getDio() {
    if (_dio == null) {
      _dio = _createDio();
    }
    return _dio;
  }
}