// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_detail_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardDetailVO _$CardDetailVOFromJson(Map<String, dynamic> json) {
  return CardDetailVO(
    json['limit'] as String,
    json['blockStatus'] as bool,
  );
}

Map<String, dynamic> _$CardDetailVOToJson(CardDetailVO instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'blockStatus': instance.blockStatus,
    };
