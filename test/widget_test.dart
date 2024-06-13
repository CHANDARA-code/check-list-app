// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:check_list_app/widget/flavor_banner.dart';
import 'package:check_list_app/config/app_config.dart';
import 'package:check_list_app/screens/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:check_list_app/main.dart';

void main() {
  testWidgets('App widget test', (WidgetTester tester) async {
    // Arrange: Create a sample AppConfig object
    final AppConfig config = AppConfig(featureFlag: true, apiUrl: '');

    // Act: Build the App widget
    await tester.pumpWidget(App(config: config));

    // Assert: Verify if the MaterialApp is created with the correct title
    final materialAppFinder = find.byType(MaterialApp);
    expect(materialAppFinder, findsOneWidget);

    final materialAppWidget = tester.widget<MaterialApp>(materialAppFinder);
    expect(materialAppWidget.title,
        'Your App Title');
  });
}

// sqp_e51b26f5d546b35b96a702ff28fd4a8a94c87b4e
// SONAR_HOST_URL