// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mean _$MeanFromJson(Map<String, dynamic> json) => Mean(
      json['mean'] as String,
      (json['example'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MeanToJson(Mean instance) => <String, dynamic>{
      'mean': instance.mean,
      'example': instance.example,
    };
