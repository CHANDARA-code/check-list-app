import 'package:check_list_app/utils/function/function.dart';

class FormStateModel {
  final String title;
  final String description;
  final String priority;
  final DateTime? timeCreated;
  final DateTime? timeUpdated;

  FormStateModel({
    this.title = '',
    this.description = '',
    this.priority = '',
    this.timeCreated,
    this.timeUpdated,
  });

  FormStateModel copyWith({
    String? title,
    String? description,
    String? priority,
    DateTime? timeCreated,
    DateTime? timeUpdated,
  }) {
    return FormStateModel(
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      timeCreated: timeCreated ?? this.timeCreated,
      timeUpdated: timeUpdated ?? this.timeUpdated,
    );
  }

  String get agoCreated =>
      timeCreated != null ? dateTimeDiff(timeCreated!) : "";
  String get agoUpdated =>
      timeCreated != null ? dateTimeDiff(timeUpdated!) : "";
}
