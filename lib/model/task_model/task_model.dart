import 'package:check_list_app/model/priority_model/priority_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  final String name;
  final bool completed;
  final PriorityModel priority;
  final DateTime dateTime;

  TaskModel({
    required this.name,
    required this.completed,
    required this.priority,
    required this.dateTime,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      name: json['name'] as String? ?? '',
      completed: json['completed'] as bool? ?? false,
      priority: PriorityModel.fromJson(
          json['priority'] as Map<String, dynamic>? ?? {}),
      dateTime: DateTime.parse(
          json['dateTime'] as String? ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);

  TaskModel copyWith(
      {String? name,
      bool? completed,
      PriorityModel? priority,
      DateTime? dateTime}) {
    return TaskModel(
      name: name ?? this.name,
      completed: completed ?? this.completed,
      priority: priority ?? this.priority,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  String get ago {
    final Duration diff = DateTime.now().difference(dateTime);
    if (diff.inDays > 1) {
      return '${diff.inDays} days ago';
    } else if (diff.inHours > 1) {
      return '${diff.inHours} hours ago';
    } else if (diff.inMinutes > 1) {
      return '${diff.inMinutes} minutes ago';
    } else {
      return 'just now';
    }
  }
}
