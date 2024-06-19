import 'package:check_list_app/model/priority_model/priority_model.dart';
import 'package:check_list_app/utils/function/function.dart';
import 'package:json_annotation/json_annotation.dart';
part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  final String name;
  final bool completed;
  final PriorityModel priority;
  final DateTime dateTime;
  final String description;
  final DateTime? timeCreated;
  final DateTime? timeUpdated;

  TaskModel({
    required this.name,
    required this.completed,
    required this.priority,
    required this.dateTime,
    required this.description,
    this.timeCreated,
    this.timeUpdated,
  });

  TaskModel copyWith({
    String? name,
    bool? completed,
    PriorityModel? priority,
    DateTime? dateTime,
    String? description,
    DateTime? timeCreated,
    DateTime? timeUpdated,
  }) {
    return TaskModel(
      name: name ?? this.name,
      completed: completed ?? this.completed,
      priority: priority ?? this.priority,
      dateTime: dateTime ?? this.dateTime,
      description: description ?? this.description,
      timeCreated: timeCreated ?? this.timeCreated,
      timeUpdated: timeUpdated ?? this.timeUpdated,
    );
  }

  String get agoCreated =>
      timeCreated != null ? dateTimeDiff(timeCreated!) : "";
  String get agoUpdated =>
      timeCreated != null ? dateTimeDiff(timeUpdated!) : "";

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}
