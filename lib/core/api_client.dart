
import 'package:dio/dio.dart';

Dio _createDio() {
  final dio = Dio(BaseOptions(
    baseUrl: "https://private-f3be7e-pagbankbootcamp.apiary-mock.com/",
  ));
  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    responseBody: true,
  ));
  return dio;
}

Dio _createDioMock() {
  final dio = Dio(BaseOptions(
    baseUrl: "http://localhost/",
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

  static Dio getDioMock() {
    if (_dio == null) {
      _dio = _createDioMock();
    }
    return _dio;
  }
}