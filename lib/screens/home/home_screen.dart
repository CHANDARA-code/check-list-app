import 'package:check_list_app/notifier/task/task_notifier.dart';
import 'package:check_list_app/screens/home/tabs/app_tab.dart';
import 'package:check_list_app/widget/animat_bottom_sheet.dart';
import 'package:check_list_app/widget/filter_option.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello! 👋'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              _showFilterBottomSheet(context, ref);
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_chart_outlined),
            onPressed: () => context.push('/dashboard'),
          ),
        ],
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
                const SizedBox(width: 10),
                Text(
                    '${tasks.where((task) => task.completed).length}/${tasks.length} Complete'),
              ],
            ),
            const AppTabs(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/details'),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return AnimatedBottomSheet(widgetBottomSheet: FilterOptions());
      },
    );
  }
}
