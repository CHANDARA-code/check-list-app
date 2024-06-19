import 'package:check_list_app/notifier/task/task_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardScreen extends HookConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider).tasks;

    // Group tasks by priority
    final groupedTasksByPriority = <String, int>{};
    for (var task in tasks) {
      groupedTasksByPriority.update(task.priority.name, (value) => value + 1,
          ifAbsent: () => 1);
    }

    final priorityData = groupedTasksByPriority.entries
        .map((entry) => _ChartData(entry.key, entry.value))
        .toList();

    // Group tasks by completion status
    final groupedTasksByStatus = <String, int>{
      'Todo': tasks.where((task) => !task.completed).length,
      'Completed': tasks.where((task) => task.completed).length,
    };

    final statusData = groupedTasksByStatus.entries
        .map((entry) => _ChartData(entry.key, entry.value))
        .toList();

    // Group tasks by priority and completion status
    final groupedTasksByPriorityAndStatus = <String, int>{};
    for (var task in tasks) {
      String key =
          '${task.priority.name} - ${task.completed ? "Completed" : "Todo"}';
      groupedTasksByPriorityAndStatus.update(key, (value) => value + 1,
          ifAbsent: () => 1);
    }

    final priorityAndStatusData = groupedTasksByPriorityAndStatus.entries
        .map((entry) => _ChartData(entry.key, entry.value))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              child: SfCircularChart(
                title: ChartTitle(text: 'Tasks by Priority'),
                legend: Legend(isVisible: true),
                series: <CircularSeries>[
                  PieSeries<_ChartData, String>(
                    dataSource: priorityData,
                    xValueMapper: (_ChartData data, _) => data.category,
                    yValueMapper: (_ChartData data, _) => data.count,
                    dataLabelMapper: (_ChartData data, _) =>
                        '${data.category}: ${data.count}',
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                  ),
                ],
              ),
            ),
            Container(
              height: 300,
              child: SfCircularChart(
                title: ChartTitle(text: 'Tasks by Status'),
                legend: Legend(isVisible: true),
                series: <CircularSeries>[
                  PieSeries<_ChartData, String>(
                    dataSource: statusData,
                    xValueMapper: (_ChartData data, _) => data.category,
                    yValueMapper: (_ChartData data, _) => data.count,
                    dataLabelMapper: (_ChartData data, _) =>
                        '${data.category}: ${data.count}',
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                  ),
                ],
              ),
            ),
            Container(
              height: 300,
              child: SfCircularChart(
                title: ChartTitle(text: 'Tasks by Priority and Status'),
                legend: Legend(isVisible: true),
                series: <CircularSeries>[
                  PieSeries<_ChartData, String>(
                    dataSource: priorityAndStatusData,
                    xValueMapper: (_ChartData data, _) => data.category,
                    yValueMapper: (_ChartData data, _) => data.count,
                    dataLabelMapper: (_ChartData data, _) =>
                        '${data.category}: ${data.count}',
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  final String category;
  final int count;

  _ChartData(this.category, this.count);
}
