// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_list_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _CardListApi implements CardListApi {
  _CardListApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<CardListResponseVO> getCardsList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/cards',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CardListResponseVO.fromJson(_result.data);
    return value;
  }
}
