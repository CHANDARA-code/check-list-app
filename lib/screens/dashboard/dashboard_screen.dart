import 'package:check_list_app/model/task_model/task_model.dart';
import 'package:check_list_app/notifier/task/task_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: SfCircularChart(
        series: <CircularSeries>[
          PieSeries<TaskModel, String>(
            dataSource: tasks,
            xValueMapper: (TaskModel task, _) => task.name,
            yValueMapper: (TaskModel task, _) => task.completed ? 1 : 0,
          ),
        ],
      ),
    );
  }
}
