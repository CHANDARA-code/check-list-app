import 'package:check_list_app/model/task_model/task_model.dart';
import 'package:check_list_app/notifier/task/task_notifier.dart';
import 'package:check_list_app/widget/task_option_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskItem extends HookConsumerWidget {
  final TaskModel task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final borderColor = task.completed
        ? Colors.green
        : Color(int.parse('0xff${task.priority.color.substring(1)}'));

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.all(12),
      child: ListTile(
        leading: Icon(
          task.completed ? Icons.check_circle : Icons.circle_outlined,
          color: task.completed
              ? Colors.green
              : Color(int.parse('0xff${task.priority.color.substring(1)}')),
        ),
        title: Text(task.name),
        subtitle: Text('${task.priority.name} • ${task.agoCreated}'),
        onTap: () => ref.read(taskProvider.notifier).toggleTaskCompletion(task),
        onLongPress: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return TaskOptionsDialog(task: task);
            },
          );
        },
      ),
    );
  }
}
