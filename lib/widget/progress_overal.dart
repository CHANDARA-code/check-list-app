import 'package:check_list_app/notifier/task/task_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProgressOverall extends HookConsumerWidget {
  const ProgressOverall({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider);
    double percentComplete = tasks.isEmpty
        ? 0
        : tasks.where((task) => task.completed).length / tasks.length;

    return Row(
      children: [
        SizedBox(
          height: 100.0, // Adjust the size as needed
          width: 100.0,
          child: SfCircularChart(
            series: <CircularSeries>[
              DoughnutSeries<ProgressOverallData, String>(
                dataSource: [
                  ProgressOverallData('Complete', percentComplete, color: Colors.green),
                  ProgressOverallData('Incomplete', 1 - percentComplete,
                      color: Colors.grey),
                ],
                xValueMapper: (ProgressOverallData data, _) => data.x,
                yValueMapper: (ProgressOverallData data, _) => data.y,
                pointColorMapper: (ProgressOverallData data, _) => data.color,
                radius: '80%',
                innerRadius:
                    '70%', 
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Text(
          '${tasks.where((task) => task.completed).length}/${tasks.length} Complete',
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
