import 'package:json_annotation/json_annotation.dart';
import 'detail.dart';

part 'vocabulary.g.dart';

@JsonSerializable()
class Vocabulary {
  String vocabulary;
  String ipa;
  List<Detail> details;

  Vocabulary(
    this.vocabulary,
    this.ipa,
    this.details
  );

  factory Vocabulary.fromJson(Map<String, dynamic> json) =>
      _$VocabularyFromJson(json);
}
