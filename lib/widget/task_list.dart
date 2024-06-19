import 'package:check_list_app/model/task_model/task_model.dart';
import 'package:check_list_app/widget/task_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskList extends HookConsumerWidget {
  final List<TaskModel> tasks;

  const TaskList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        ...tasks.map((task) => TaskItem(task: task)).toList(),
      ],
    );
  }
}
