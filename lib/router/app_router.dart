import 'package:check_list_app/screens/dashboard/dashboard_screen.dart';
import 'package:check_list_app/screens/detail/details_screen.dart';
import 'package:check_list_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final AppRouter _instance = AppRouter._internal();
  factory AppRouter() => _instance;

  late final GoRouter _router;

  AppRouter._internal() {
    _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: '/details',
          builder: (context, state) => DetailsScreen(),
        ),
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => DashboardScreen(),
        ),
      ],
    );
  }

  GoRouter get router => _router;
}
