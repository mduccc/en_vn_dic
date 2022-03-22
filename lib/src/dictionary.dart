import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:en_vi_dic/src/entity/vocabulary.dart';

part 'core/storage.dart';

class EnViDic {
  static EnViDic? _instance;
  final _Storage _storage = _Storage();
  bool _hasInit = false;
  bool get hasInit => _hasInit;

  EnViDic._();

  factory EnViDic() {
    _instance ??= EnViDic._();
    return _instance!;
  }

  Future init() async {
    await _storage.loadData();
    _hasInit = true;
  }

  Vocabulary? lookUp(String englishVocabulary) {
    if (!_hasInit || englishVocabulary.isEmpty) {
      return null;
    }
    final data = _storage.getValueByKey(englishVocabulary.toLowerCase().trim());
    if (data.isEmpty) {
      return null;
    }
    return Vocabulary.fromJson(data);
  }

  List<Vocabulary> suggest(String keyword) {
    if (!_hasInit || keyword.isEmpty) {
      return [];
    }
    return _storage
        .suggest(keyword)
        .map((ele) => Vocabulary.fromJson(ele))
        .toList();
  }
}
