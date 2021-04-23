import 'package:json_annotation/json_annotation.dart';
import 'package:mvp_flutter/provider/card_layout_vo.dart';

part 'card_response_vo.g.dart';

@JsonSerializable()
class CardResponseVO {

  final String id;
  final String title;
  final String lastDigits;
  final String description;
  final String cardBrand;
  final CardLayoutVO layoutAttrs;

  CardResponseVO(this.id, this.title, this.lastDigits, this.description, this.cardBrand, this.layoutAttrs);

  factory CardResponseVO.fromJson(Map<String, dynamic> json) =>
      _$CardResponseVOFromJson(json);

  Map<String, dynamic> toJson() => _$CardResponseVOToJson(this);
}