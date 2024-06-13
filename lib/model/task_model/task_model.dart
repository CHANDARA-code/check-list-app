import 'package:check_list_app/model/priority_model/priority_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  final String name;
  final bool completed;
  final PriorityModel priority;

  TaskModel(
      {required this.name, required this.completed, required this.priority});

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
  Map<String, dynamic> toJson() => _$TaskModelToJson(this);

  TaskModel copyWith({String? name, bool? completed, PriorityModel? priority}) {
    return TaskModel(
      name: name ?? this.name,
      completed: completed ?? this.completed,
      priority: priority ?? this.priority,
    );
  }
}
