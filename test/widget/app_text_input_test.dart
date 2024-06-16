import 'package:check_list_app/widget/app_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  group('AppTextInput Widget Tests', () {
    testWidgets('Displays initial value', (WidgetTester tester) async {
      const initialValue = 'Initial Title';
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: AppTextInput(
                initialValue: initialValue,
                labelText: 'Title',
                onChanged: (value) {},
                validator: (value) => null,
              ),
            ),
          ),
        ),
      );

      final textField = find.byType(TextFormField);
      expect(textField, findsOneWidget);
      expect(find.text(initialValue), findsOneWidget);
    });

    testWidgets('Calls onChanged when text is entered',
        (WidgetTester tester) async {
      String changedValue = '';
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: AppTextInput(
                initialValue: '',
                labelText: 'Title',
                onChanged: (value) {
                  changedValue = value;
                },
                validator: (value) => null,
              ),
            ),
          ),
        ),
      );

      final textField = find.byType(TextFormField);
      await tester.enterText(textField, 'New Title');
      expect(changedValue, 'New Title');
    });
  });
}
