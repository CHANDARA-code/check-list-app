import 'package:flutter/material.dart';

class AppDropDown extends StatelessWidget {
  final String? value;
  final List<String> items;
  final String labelText;
  final void Function(String?) onChanged;
  final String? Function(String?)? validator;

  const AppDropDown({
    Key? key,
    required this.value,
    required this.items,
    required this.labelText,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      items: items.map((String priority) {
        return DropdownMenuItem<String>(
          value: priority,
          child: Text(priority),
        );
      }).toList(),
      onChanged: onChanged,
      validator: validator != null ? (value) => validator!(value) : null,
      icon: Icon(Icons.arrow_drop_down, color: Colors.blue),
      dropdownColor: Colors.white,
      style: TextStyle(color: Colors.black),
      isExpanded: true,
    );
  }
}
