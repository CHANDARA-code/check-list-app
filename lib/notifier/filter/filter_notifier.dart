import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedItemNotifier extends StateNotifier<String> {
  SelectedItemNotifier(String initialSelectedItem) : super(initialSelectedItem);

  void selectItem(String item) {
    state = item;
  }
}

final selectedItemProviderTask =
    StateNotifierProvider<SelectedItemNotifier, String>((ref) {
  // Provide the initial selected item
  return SelectedItemNotifier("All");
});

final selectedItemProviderPriority =
    StateNotifierProvider<SelectedItemNotifier, String>((ref) {
  // Provide the initial selected item
  return SelectedItemNotifier("All");
});
