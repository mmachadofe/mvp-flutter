// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_response_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardResponseVO _$CardResponseVOFromJson(Map<String, dynamic> json) {
  return CardResponseVO(
    json['id'] as String,
    json['title'] as String,
    json['lastDigits'] as String,
    json['description'] as String,
    json['cardBrand'] as String,
    json['layoutAttrs'] == null
        ? null
        : CardLayoutVO.fromJson(json['layoutAttrs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CardResponseVOToJson(CardResponseVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'lastDigits': instance.lastDigits,
      'description': instance.description,
      'cardBrand': instance.cardBrand,
      'layoutAttrs': instance.layoutAttrs,
    };
