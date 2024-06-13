import 'package:check_list_app/notifier/task/task_notifier.dart';
import 'package:check_list_app/widget/task_list.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AllTab extends HookConsumerWidget {
  const AllTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider);
    return Column(
      children: [
        // ProjectCard(
        //   complete: tasks.where((task) => task.completed).length,
        //   total: tasks.length,
        // ),
        Expanded(
          child: TaskList(tasks: tasks),
        ),
      ],
    );
  }
}
