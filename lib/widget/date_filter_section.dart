import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFilterSection extends StatelessWidget {
  final ValueNotifier<DateTime?> selectedDate;
  final ValueNotifier<DateTimeRange?> selectedDateRange;

  const DateFilterSection({
    Key? key,
    required this.selectedDate,
    required this.selectedDateRange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Date',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text(selectedDate.value != null
                ? 'Selected date: ${DateFormat.yMd().format(selectedDate.value!)}'
                : 'Select a date'),
            trailing: const Icon(Icons.calendar_today),
            onTap: () async {
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: selectedDate.value ?? DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null) {
                selectedDate.value = pickedDate;
                selectedDateRange.value = null;
              }
            },
          ),
          ListTile(
            title: Text(
              selectedDateRange.value != null
                  ? 'Selected range: ${DateFormat.yMd().format(selectedDateRange.value!.start)} - ${DateFormat.yMd().format(selectedDateRange.value!.end)}'
                  : 'Select a date range',
            ),
            trailing: Icon(Icons.calendar_today),
            onTap: () async {
              final DateTimeRange? pickedDateRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
                initialDateRange: selectedDateRange.value,
              );
              if (pickedDateRange != null) {
                selectedDateRange.value = pickedDateRange;
                selectedDate.value = null;
              }
            },
          ),
        ],
      ),
    );
  }
}
