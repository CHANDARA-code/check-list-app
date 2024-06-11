import 'package:check_list_app/config/app_config.dart';
import 'package:flutter/material.dart';
import '../config/flavors.dart';

class MyHomePage extends StatelessWidget {
  final AppConfig config;
  MyHomePage({required this.config});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Hello ${F.title}',
            ),
            Text('API URL: ${config.apiUrl}'),
            Text('Feature Flag: ${config.featureFlag}'),
          ],
        ),
      ),
    );
  }
}
