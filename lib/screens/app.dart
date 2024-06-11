import 'package:check_list_app/components/flavor_banner.dart';
import 'package:check_list_app/config/app_config.dart';
import 'package:check_list_app/config/flavors.dart';
import 'package:check_list_app/screens/my_home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final AppConfig config;
  App({required this.config});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: F.title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlavorBanner(
        child: MyHomePage(config: config),
        show: config.featureFlag,
        message: F.name,
      ),
    );
  }
}
