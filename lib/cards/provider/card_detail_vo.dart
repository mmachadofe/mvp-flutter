import 'package:json_annotation/json_annotation.dart';

part 'card_detail_vo.g.dart';

@JsonSerializable()
class CardDetailVO {

  final String limit;
  final bool blockStatus;

  CardDetailVO(this.limit, this.blockStatus);

  factory CardDetailVO.fromJson(Map<String, dynamic> json) =>
      _$CardDetailVOFromJson(json);

  Map<String, dynamic> toJson() => _$CardDetailVOToJson(this);
}