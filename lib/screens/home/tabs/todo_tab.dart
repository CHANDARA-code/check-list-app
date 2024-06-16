import 'package:check_list_app/notifier/task/task_notifier.dart';
import 'package:check_list_app/widget/empty_widget.dart';
import 'package:check_list_app/widget/task_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoTab extends HookConsumerWidget {
  const TodoTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider).tasks;
    final tasksTodo = tasks.where((task) => !task.completed).toList();
    if (tasksTodo == null || tasksTodo.isEmpty) {
      return const EmptyWidget();
    }
    return Column(
      children: [
        Expanded(
          child: TaskList(tasks: tasksTodo),
        ),
      ],
    );
  }
}
