import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mvp_flutter/core/api_client.dart';

class MockClientAdapter extends HttpClientAdapter {
  final _responses = HashMap();

  Dio dio;

  MockClientAdapter() {
    dio = ApiClient.getDioMock();
    dio.httpClientAdapter = this;
  }

  void addResponse(MockResponse response) {
    _responses[response.path] = response;
  }

  @override
  void close({bool force = false}) {}

  @override
  Future<ResponseBody> fetch(RequestOptions options,
      Stream<List<int>> requestStream, Future cancelFuture) {
    final path = options.path;
    if (!_responses.containsKey(path)) {
      return Future.value(ResponseBody.fromString('', HttpStatus.notFound));
    }

    final MockResponse response = _responses[path];

    return Future.value(ResponseBody.fromString(
      response.body,
      response.responseCode,
      headers: {
        HttpHeaders.contentTypeHeader: [ContentType.json.value]
      },
    ));
  }
}

class MockResponse {
  final String path;
  final int responseCode;
  final String body;

  MockResponse(this.path, {this.responseCode = 200, this.body = ""});
}
