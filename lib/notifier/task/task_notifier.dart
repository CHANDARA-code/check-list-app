import 'package:check_list_app/model/priority_model/priority_model.dart';
import 'package:check_list_app/model/task_model/task_model.dart';
import 'package:check_list_app/service/storage/task_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, List<TaskModel>>(
    (ref) => TaskNotifier());

class TaskNotifier extends StateNotifier<List<TaskModel>> {
  TaskNotifier() : super([]) {
    _initializeTasks();
    // _clearAll();
  }

  void addTask(TaskModel task) {
    state = [...state, task];
    _saveToStorage();
  }

  void toggleTaskCompletion(TaskModel task) {
    state = [
      for (final t in state)
        if (t == task) t.copyWith(completed: !t.completed) else t
    ];
    _saveToStorage();
  }

  void applyFilters(String priority, String status, DateTime? date,
      DateTimeRange? dateRange) {
    // Implement the filter logic here
    state = [
      for (final t in state)
        if ((priority == 'All' || t.priority.name == priority) &&
            (status == 'All' ||
                (status == 'Completed' && t.completed) ||
                (status == 'Todo' && !t.completed)) &&
            (date == null || t.dateTime.isAtSameMomentAs(date)) &&
            (dateRange == null ||
                (t.dateTime.isAfter(dateRange.start) &&
                    t.dateTime.isBefore(dateRange.end))))
          t
    ];
  }

  void onClearFilter() {
    String priority = 'null';
    String status = 'null';
    DateTime? date = null;
    DateTimeRange? dateRange = null;
    applyFilters(priority, status, date, dateRange);
    _initializeTasks();
  }

  void _saveToStorage() async {
    var taskStorage = TaskStorage();
    var value = state.map((task) => task.toJson()).toList();
    await taskStorage.write({'tasks': value});
  }

  void _loadFromStorage() async {
    var taskStorage = TaskStorage();
    var storedData = await taskStorage.read();
    if (storedData != null && storedData['tasks'] != null) {
      final List<dynamic> tasksList = storedData['tasks'];
      state = tasksList.map((json) => TaskModel.fromJson(json)).toList();
    }
  }

  void _clearAll() async {
    var taskStorage = TaskStorage();
    await taskStorage.clear();
  }

  void _initializeTasks() async {
    var taskStorage = TaskStorage();
    var storedData = await taskStorage.read();

    if (storedData == null || storedData['tasks'] == null) {
      List<TaskModel> initialTasks = [
        TaskModel(
            name: 'Water the plants',
            completed: false,
            priority: PriorityModel(id: '1', name: 'Normal', color: '#fcba03'),
            dateTime: DateTime.now().subtract(Duration(days: 1))),
        TaskModel(
            name: 'Mom’s birthday 🎂',
            completed: false,
            priority: PriorityModel(id: '2', name: 'Medium', color: '#fc7b03'),
            dateTime: DateTime.now().subtract(Duration(hours: 5))),
        TaskModel(
            name: 'Dinner w/ friends',
            completed: false,
            priority: PriorityModel(id: '1', name: 'Normal', color: '#fcba03'),
            dateTime: DateTime.now().subtract(Duration(hours: 3))),
        TaskModel(
            name: 'Pay bill 1',
            completed: false,
            priority: PriorityModel(id: '3', name: 'High', color: '#cc0404'),
            dateTime: DateTime.now().subtract(Duration(days: 2))),
        TaskModel(
            name: 'Work event',
            completed: false,
            priority: PriorityModel(id: '2', name: 'Medium', color: '#fc7b03'),
            dateTime: DateTime.now().subtract(Duration(hours: 8))),
        TaskModel(
            name: 'Pay bill 2',
            completed: false,
            priority: PriorityModel(id: '1', name: 'Normal', color: '#fcba03'),
            dateTime: DateTime.now().subtract(Duration(days: 3))),
        TaskModel(
            name: 'Grocery shopping',
            completed: false,
            priority: PriorityModel(id: '2', name: 'Medium', color: '#fc7b03'),
            dateTime: DateTime.now().subtract(Duration(hours: 10))),
        TaskModel(
            name: 'Call the doctor',
            completed: false,
            priority: PriorityModel(id: '3', name: 'High', color: '#cc0404'),
            dateTime: DateTime.now().subtract(Duration(minutes: 30))),
        TaskModel(
            name: 'Clean the house',
            completed: false,
            priority: PriorityModel(id: '1', name: 'Normal', color: '#fcba03'),
            dateTime: DateTime.now().subtract(Duration(hours: 6))),
        TaskModel(
            name: 'Finish project report',
            completed: false,
            priority: PriorityModel(id: '3', name: 'High', color: '#cc0404'),
            dateTime: DateTime.now().subtract(Duration(days: 4))),
      ];
      state = initialTasks;
      _saveToStorage();
    } else {
      _loadFromStorage();
    }
  }
}
