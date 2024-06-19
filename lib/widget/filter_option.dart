import 'package:check_list_app/notifier/filter/filter_notifier.dart';
import 'package:check_list_app/notifier/task/task_notifier.dart';
import 'package:check_list_app/widget/app_button.dart';
import 'package:check_list_app/widget/filter_section.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilterOptions extends HookConsumerWidget {
  const FilterOptions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskNotifier = ref.watch(taskProvider.notifier);
    const List<String> optionsPriority = [
      'All',
      'Normal',
      'Medium',
      'High',
    ];
    const List<String> optionsTask = [
      'All',
      'Todo',
      'Completed',
    ];

    return Container(
      padding: EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Spacer(),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FilterSection(
                    title: 'Priority',
                    options: optionsPriority,
                    onSelected: (value) {
                      taskNotifier.updateSelectedPriority(value!);
                    },
                    provider: selectedItemProviderTask,
                  ),
                  FilterSection(
                    title: 'Task',
                    options: optionsTask,
                    onSelected: (value) {
                      taskNotifier.updateSelectedTaskStatus(value!);
                    },
                    provider: selectedItemProviderPriority,
                  ),
                ],
              ),
            ),
          ),
          buildButton(taskNotifier, context, ref),
        ],
      ),
    );
  }

  Row buildButton(
      TaskNotifier taskNotifier, BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppButton(
          iconData: Icons.delete_forever_sharp,
          label: "Clear",
          backgroundColor: Colors.red, // Background color
          foregroundColor: Colors.white, // Text color
          onPressed: () {
            ref.read(selectedItemProviderTask.notifier).selectItem("All");
            ref.read(selectedItemProviderPriority.notifier).selectItem("All");
            taskNotifier.onClearFilter();
            Navigator.of(context).pop();
          },
        ),
        AppButton(
          iconData: Icons.change_circle_outlined,
          label: "Save",
          backgroundColor: Colors.blueGrey, // Background color
          foregroundColor: Colors.white, // Text color
          onPressed: () {
            taskNotifier.applyFilters();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
