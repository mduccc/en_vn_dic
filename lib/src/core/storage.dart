part of '../dictionary.dart';

class _Storage {
  Map<String, dynamic>? _cache;

  Future<void> loadData() async {
    if (_cache == null) {
      final String data = await rootBundle
          .loadString("packages/en_vi_dic/assets/data/vocabularies.json");
      _cache = json.decode(data);
    }
  }

  Map<String, dynamic> getValueByKey(String key) {
    final firstChar = key[0].toLowerCase();
    if (_cache!.containsKey(firstChar)) {
      return _cache![firstChar][key.toLowerCase()];
    }
    return {};
  }

  List<Map<String, dynamic>> suggest(String key) {
    final firstChar = key[0].toLowerCase();
    final limit = 20;
    if (_cache!.containsKey(firstChar)) {
      final List<Map<String, dynamic>> results = [];

      for (String k in _cache![firstChar].keys) {
        if (k.contains(key.toLowerCase()) &&
            k.indexOf(key.toLowerCase()) == 0) {
          try {
            final List details = _cache![firstChar][k]['details'];
            if (details.isNotEmpty) {
              results.add(_cache![firstChar][k]);
            }
          } catch (e) {
            print(e);
          }
        }
      }
      results.sort(
          (a, b) => a['vocabulary'].length > b['vocabulary'].length ? 1 : -1);
      return results.sublist(
          0, results.length >= limit ? limit : results.length);
    }
    return [];
  }
}
