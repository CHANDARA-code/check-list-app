import 'package:check_list_app/model/task_model/task_model.dart';
import 'package:check_list_app/notifier/task/task_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskItem extends HookConsumerWidget {
  final TaskModel task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Icon(
        task.completed ? Icons.check_circle : Icons.circle_outlined,
        color: task.completed
            ? Colors.green
            : Color(int.parse('0xff${task.priority.color.substring(1)}')),
      ),
      title: Text(task.name),
      subtitle: Text('${task.priority.name} • ${task.ago}'),
      onTap: () => ref.read(taskProvider.notifier).toggleTaskCompletion(task),
    );
  }
}
