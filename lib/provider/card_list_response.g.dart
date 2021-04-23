// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardListResponseVO _$CardListResponseVOFromJson(Map<String, dynamic> json) {
  return CardListResponseVO(
    (json['cards'] as List)
        ?.map((e) => e == null
            ? null
            : CardResponseVO.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CardListResponseVOToJson(CardListResponseVO instance) =>
    <String, dynamic>{
      'cards': instance.cards,
    };
