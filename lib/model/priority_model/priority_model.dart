import 'package:json_annotation/json_annotation.dart';

part 'priority_model.g.dart';

@JsonSerializable()
class PriorityModel {
  final String id;
  final String name;
  final String color;

  PriorityModel({
    required this.id,
    required this.name,
    required this.color,
  });

  factory PriorityModel.fromJson(Map<String, dynamic> json) =>
      _$PriorityModelFromJson(json);
  Map<String, dynamic> toJson() => _$PriorityModelToJson(this);
}
