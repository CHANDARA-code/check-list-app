import 'package:check_list_app/model/task_model/task_model.dart';
import 'package:check_list_app/notifier/task/task_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProgressOverall extends HookConsumerWidget {
  const ProgressOverall({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider).tasks;
    double percentComplete = tasks.isEmpty
        ? 0
        : tasks.where((task) => task.completed).length / tasks.length;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: percentComplete == 1
          ? _buildCompletedWidget()
          : _buildProgressWidget(percentComplete, tasks),
    );
  }

  Widget _buildCompletedWidget() {
    return const Row(
      key: ValueKey('completed'),
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check_circle, color: Colors.green, size: 100.0),
        SizedBox(width: 10),
        Text(
          'All tasks complete!',
          style: TextStyle(fontSize: 16, color: Colors.green),
        ),
      ],
    );
  }

  Widget _buildProgressWidget(double percentComplete, List<TaskModel> tasks) {
    return Row(
      key: ValueKey('progress'), // Unique key to trigger animation
      children: [
        SizedBox(
          height: 100.0,
          width: 100.0,
          child: SfCircularChart(
            series: <CircularSeries>[
              DoughnutSeries<ProgressOverallData, String>(
                dataSource: [
                  ProgressOverallData('Complete', percentComplete,
                      color: Colors.green),
                  ProgressOverallData('Incomplete', 1 - percentComplete,
                      color: Colors.grey),
                ],
                xValueMapper: (ProgressOverallData data, _) => data.x,
                yValueMapper: (ProgressOverallData data, _) => data.y,
                pointColorMapper: (ProgressOverallData data, _) => data.color,
                radius: '80%',
                innerRadius: '70%',
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Text(
          '${tasks.where((task) => task.completed).length}/${tasks.length} Complete',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class ProgressOverallData {
  ProgressOverallData(this.x, this.y, {required this.color});
  final String x;
  final double y;
  final Color color;
}
