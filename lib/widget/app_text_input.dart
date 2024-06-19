import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppTextInput extends HookConsumerWidget {
  final String? initialValue;
  final String labelText;
  final Function(String) onChanged;
  final String? Function(String?)? validator;
  final TextStyle? style;
  final InputDecoration? decoration;

  const AppTextInput({
    super.key,
    required this.initialValue,
    required this.labelText,
    required this.onChanged,
    required this.validator,
    this.style,
    this.decoration,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      initialValue: initialValue,
      style: style,
      decoration: decoration ?? InputDecoration(labelText: labelText),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
