import 'package:check_list_app/notifier/task/task_notifier.dart';
import 'package:check_list_app/widget/task_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailsScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Weekly Groceries'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Task List'),
            ...tasks.where((task) => !task.completed).map((task) => TaskItem(
                  task: task,
                )),
            SizedBox(height: 20),
            Text('Completed'),
            ...tasks.where((task) => task.completed).map((task) => TaskItem(
                  task: task,
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
