// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      name: json['name'] as String,
      completed: json['completed'] as bool,
      priority:
          PriorityModel.fromJson(json['priority'] as Map<String, dynamic>),
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'name': instance.name,
      'completed': instance.completed,
      'priority': instance.priority,
      'dateTime': instance.dateTime.toIso8601String(),
    };
