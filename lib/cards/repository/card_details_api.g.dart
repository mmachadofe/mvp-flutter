// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_details_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _CardDetailsApi implements CardDetailsApi {
  _CardDetailsApi(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<CardDetailVO> getDetailCard(walletId) async {
    ArgumentError.checkNotNull(walletId, 'walletId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/cards/$walletId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CardDetailVO.fromJson(_result.data);
    return value;
  }
}
