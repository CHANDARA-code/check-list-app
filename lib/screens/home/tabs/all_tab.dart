import 'package:check_list_app/notifier/task/task_notifier.dart';
import 'package:check_list_app/widget/task_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AllTab extends HookConsumerWidget {
  const AllTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider).tasks;
    if (tasks == null || tasks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/empty.png',
              width: 200,
            ),
            Text(
              'No tasks available',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      );
    }
    return Column(
      children: [
        Expanded(
          child: TaskList(tasks: tasks),
        ),
      ],
    );
  }
}
