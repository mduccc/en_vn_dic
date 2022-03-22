// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vocabulary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vocabulary _$VocabularyFromJson(Map<String, dynamic> json) => Vocabulary(
      json['vocabulary'] as String,
      json['ipa'] as String,
      (json['details'] as List<dynamic>)
          .map((e) => Detail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VocabularyToJson(Vocabulary instance) =>
    <String, dynamic>{
      'vocabulary': instance.vocabulary,
      'ipa': instance.ipa,
      'details': instance.details,
    };
