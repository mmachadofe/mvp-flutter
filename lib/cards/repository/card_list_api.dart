
import 'package:dio/dio.dart';
import 'package:mvp_flutter/cards/provider/card_list_response.dart';
import 'package:retrofit/http.dart';

part 'card_list_api.g.dart';
@RestApi()
abstract class CardListApi {

  factory CardListApi(Dio dio) = _CardListApi;

  //static CardListApi _instance;

  @GET("/cards")
  Future<CardListResponseVO> getCardsList();
}