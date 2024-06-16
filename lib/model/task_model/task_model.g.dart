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
      description: json['description'] as String,
      timeCreated: json['timeCreated'] == null
          ? null
          : DateTime.parse(json['timeCreated'] as String),
      timeUpdated: json['timeUpdated'] == null
          ? null
          : DateTime.parse(json['timeUpdated'] as String),
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'name': instance.name,
      'completed': instance.completed,
      'priority': instance.priority,
      'dateTime': instance.dateTime.toIso8601String(),
      'description': instance.description,
      'timeCreated': instance.timeCreated?.toIso8601String(),
      'timeUpdated': instance.timeUpdated?.toIso8601String(),
    };
