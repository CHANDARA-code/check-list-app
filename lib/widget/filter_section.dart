import 'package:check_list_app/notifier/filter/filter_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilterSection extends HookConsumerWidget {
  final String title;
  final List<String> options;
  // final String selectedItem;
  final Function(String?) onSelected;
  final StateNotifierProvider<SelectedItemNotifier, String> provider;

  const FilterSection({
    Key? key,
    required this.title,
    required this.options,
    // required this.selectedItem,
    required this.onSelected,
    required this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItem = ref.watch(provider);
    final selectedItemNotifier = ref.read(provider.notifier);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Wrap(
            spacing: 8.0,
            children: options.map((option) {
              final isSelected = selectedItem == option;
              return ChoiceChip(
                label: Text(option),
                selected: isSelected,
                onSelected: (selected) {
                  if (selected) {
                    selectedItemNotifier.selectItem(option);
                    onSelected(option);
                  }
                },
                selectedColor: Colors.blue,
                backgroundColor: Colors.grey[200],
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
