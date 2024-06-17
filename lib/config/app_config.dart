import 'dart:convert';
import 'package:flutter/services.dart';

class AppConfig {
  final String apiUrl;
  final bool featureFlag;

  AppConfig({required this.apiUrl, required this.featureFlag});

  static Future<AppConfig> load(String environment) async {
    final configString =
        await rootBundle.loadString('assets/config_$environment.json');
    final configData = json.decode(configString);
    return AppConfig(
      apiUrl: configData['apiUrl'],
      featureFlag: configData['featureFlag'],
    );
  }
}
