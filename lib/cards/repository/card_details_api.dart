import 'package:dio/dio.dart';
import 'package:mvp_flutter/cards/provider/card_detail_vo.dart';
import 'package:retrofit/http.dart';

part 'card_details_api.g.dart';

@RestApi()
abstract class CardDetailsApi {

  factory CardDetailsApi(Dio dio) = _CardDetailsApi;

  //static CardDetailsApi _instance;

  @GET("/cards/{walletId}")
  Future<CardDetailVO> getDetailCard(@Path("walletId") walletId);
}