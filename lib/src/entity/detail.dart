import 'package:json_annotation/json_annotation.dart';
import 'mean.dart';

part 'detail.g.dart';

@JsonSerializable()
class Detail {
  String pos;
  List<Mean> means;

  Detail(this.pos, this.means);

  factory Detail.fromJson(Map<String, dynamic> json) =>
      _$DetailFromJson(json);
}
