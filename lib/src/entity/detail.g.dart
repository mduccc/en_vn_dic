// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Detail _$DetailFromJson(Map<String, dynamic> json) => Detail(
      json['pos'] as String,
      (json['means'] as List<dynamic>)
          .map((e) => Mean.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'pos': instance.pos,
      'means': instance.means,
    };
