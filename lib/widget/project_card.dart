import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProjectCard extends HookConsumerWidget {
  final int complete;
  final int total;

  ProjectCard({required this.complete, required this.total});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Colors.lightGreen[100],
      child: ListTile(
        title: Text('Weekly Groceries'),
        subtitle: Text('$complete/$total Complete'),
        trailing: Text('Feb 2'),
      ),
    );
  }
}
