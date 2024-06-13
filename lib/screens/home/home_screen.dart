import 'package:check_list_app/notifier/task/task_notifier.dart';
import 'package:check_list_app/screens/home/tabs/all_tab.dart';
import 'package:check_list_app/screens/home/tabs/completed_tab.dart';
import 'package:check_list_app/screens/home/tabs/todo_tab.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hello! 👋'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Indicator
            Row(
              children: [
                CircularProgressIndicator(
                    value: tasks.where((task) => task.completed).length /
                        (tasks.length == 0 ? 1 : tasks.length)),
                SizedBox(width: 10),
                Text(
                    '${tasks.where((task) => task.completed).length}/${tasks.length} Complete'),
              ],
            ),
            // Tabs
            DefaultTabController(
              length: 3,
              child: Expanded(
                child: Column(
                  children: [
                    const TabBar(
                      tabs: [
                        Tab(text: 'All'),
                        Tab(text: 'Todo'),
                        Tab(text: 'Completed'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          AllTab(),
                          TodoTab(),
                          CompletedTab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Floating Action Button
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/details'),
        child: Icon(Icons.add),
      ),
    );
  }
}
