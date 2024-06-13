import 'package:check_list_app/config/app_config.dart';
import 'package:check_list_app/router/app_router.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final AppConfig config;
  App({required this.config});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter().router,
    );
  }
}
