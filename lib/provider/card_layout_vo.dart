import 'package:json_annotation/json_annotation.dart';

part 'card_layout_vo.g.dart';

@JsonSerializable()
class CardLayoutVO {

  final String bgColor;
  final String titleColor;

  CardLayoutVO(this.bgColor, this.titleColor);

  factory CardLayoutVO.fromJson(Map<String, dynamic> json) =>
      _$CardLayoutVOFromJson(json);

  Map<String, dynamic> toJson() => _$CardLayoutVOToJson(this);
}