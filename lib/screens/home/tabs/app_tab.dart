import 'package:check_list_app/screens/home/tabs/all_tab.dart';
import 'package:check_list_app/screens/home/tabs/completed_tab.dart';
import 'package:check_list_app/screens/home/tabs/todo_tab.dart';
import 'package:flutter/material.dart';

class AppTabs extends StatelessWidget {
  const AppTabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Expanded(
        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'All'),
                Tab(text: 'Todo'),
                Tab(text: 'Completed'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  AllTab(),
                  TodoTab(),
                  CompletedTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
