import 'package:check_list_app/notifier/task/task_notifier.dart';
import 'package:check_list_app/widget/app_button.dart';
import 'package:check_list_app/widget/date_filter_section.dart';
import 'package:check_list_app/widget/filter_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilterOptions extends HookConsumerWidget {
  const FilterOptions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskNotifier = ref.watch(taskProvider.notifier);
    final selectedPriority = useState<String>("null");
    final selectedTaskStatus = useState<String>("null");
    final selectedDate = useState<DateTime?>(null);
    final selectedDateRange = useState<DateTimeRange?>(null);
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
                    selectedItem: selectedPriority.value,
                    onSelected: (value) {
                      selectedPriority.value = value!;
                    },
                  ),
                  FilterSection(
                    title: 'Task',
                    options: optionsTask,
                    selectedItem: selectedTaskStatus.value,
                    onSelected: (value) {
                      selectedTaskStatus.value = value!;
                    },
                  ),
                  DateFilterSection(
                      selectedDate: selectedDate,
                      selectedDateRange: selectedDateRange)
                ],
              ),
            ),
          ),
          buildButton(taskNotifier, context, selectedPriority,
              selectedTaskStatus, selectedDate, selectedDateRange),
        ],
      ),
    );
  }

  Row buildButton(
      TaskNotifier taskNotifier,
      BuildContext context,
      ValueNotifier<String> selectedPriority,
      ValueNotifier<String> selectedTaskStatus,
      ValueNotifier<DateTime?> selectedDate,
      ValueNotifier<DateTimeRange?> selectedDateRange) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppButton(
          onPressed: () {
            taskNotifier.onClearFilter();
            Navigator.of(context).pop();
          },
          icon: Icons.delete_forever_sharp,
          title: "Clear",
          backgroundColor: Colors.white,
          iconColor: Colors.red,
        ),
        AppButton(
          onPressed: () {
            taskNotifier.applyFilters(
              selectedPriority.value,
              selectedTaskStatus.value,
              selectedDate.value,
              selectedDateRange.value,
            );
            Navigator.of(context).pop();
          },
          icon: Icons.change_circle_outlined,
          title: "Save",
          backgroundColor: Colors.white,
          iconColor: Colors.blue.shade600,
        ),
      ],
    );
  }
}
