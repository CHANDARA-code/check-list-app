import 'dart:async';
import 'package:check_list_app/screens/app.dart';
import 'package:check_list_app/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const environment = String.fromEnvironment('FLAVOR', defaultValue: 'dev');
  final config = await AppConfig.load(environment);
  runApp(ProviderScope(child: App(config: config)));
}
