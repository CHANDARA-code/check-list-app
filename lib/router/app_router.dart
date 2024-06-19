import 'package:check_list_app/model/task_model/task_model.dart';
import 'package:check_list_app/screens/dashboard/dashboard_screen.dart';
import 'package:check_list_app/screens/detail/details_screen.dart';
import 'package:check_list_app/screens/home/home_screen.dart';
import 'package:flutter/widgets.dart';
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
          pageBuilder: (context, state) {
            return CustomTransitionPage<void>(
              key: state.pageKey,
              child: const HomeScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: '/details',
          pageBuilder: (context, state) {
            final TaskModel? task = state.extra as TaskModel?;
            return CustomTransitionPage<void>(
              key: state.pageKey,
              child: DetailsScreen(
                originalTask: task,
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: '/dashboard',
          pageBuilder: (context, state) {
            return CustomTransitionPage<void>(
              key: state.pageKey,
              child: DashboardScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          },
        ),
      ],
    );
  }

  GoRouter get router => _router;
}
