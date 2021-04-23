import 'package:json_annotation/json_annotation.dart';
import 'package:mvp_flutter/cards/provider/card_response_vo.dart';

part 'card_list_response.g.dart';

@JsonSerializable()
class CardListResponseVO {

  final List<CardResponseVO> cards;

  CardListResponseVO(this.cards);

  factory CardListResponseVO.fromJson(Map<String, dynamic> json) =>
      _$CardListResponseVOFromJson(json);

  Map<String, dynamic> toJson() => _$CardListResponseVOToJson(this);

}