import 'package:flutter/material.dart';

class FilterSection extends StatelessWidget {
  final String title;
  final List<String> options;
  final String selectedItem;
  final Function(String?) onSelected;

  const FilterSection({
    Key? key,
    required this.title,
    required this.options,
    required this.selectedItem,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  onSelected(option);
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
