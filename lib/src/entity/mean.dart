import 'package:json_annotation/json_annotation.dart';

part 'mean.g.dart';

@JsonSerializable()
class Mean {
  String mean;
  List<String> example;

  Mean(this.mean, this.example);

  factory Mean.fromJson(Map<String, dynamic> json) =>
      _$MeanFromJson(json);
}