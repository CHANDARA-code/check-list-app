import 'dart:collection';
import 'package:check_list_app/model/task_model/task_model.dart';
import 'package:check_list_app/service/storage/task_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final taskProvider =
    ChangeNotifierProvider<TaskNotifier>((ref) => TaskNotifier());

class TaskNotifier extends ChangeNotifier {
  List<TaskModel> _tasks = [];
  List<TaskModel> _allTasks = [];
  String _selectedPriority = "All";
  String _selectedTaskStatus = "All";
  UnmodifiableListView<TaskModel> get tasks => UnmodifiableListView(_tasks);
  String get selectedPriority => _selectedPriority;
  String get selectedTaskStatus => _selectedTaskStatus;

  TaskNotifier() {
    _initializeTasks();
  }

  void addTask(TaskModel task) {
    _tasks = [..._tasks, task];
    _allTasks = [..._allTasks, task];
    _saveToStorage();
    notifyListeners();
  }

  void updateTask(TaskModel updatedTask) {
    _tasks = _tasks.map((task) {
      return task.dateTime == updatedTask.dateTime ? updatedTask : task;
    }).toList();
    _allTasks = _allTasks.map((task) {
      return task.dateTime == updatedTask.dateTime ? updatedTask : task;
    }).toList();
    _saveToStorage();
    notifyListeners();
  }

  void toggleTaskCompletion(TaskModel task) {
    _tasks = [
      for (final t in _tasks)
        if (t == task) t.copyWith(completed: !t.completed) else t
    ];
    _allTasks = [
      for (final t in _allTasks)
        if (t == task) t.copyWith(completed: !t.completed) else t
    ];
    _saveToStorage();
    notifyListeners();
  }

  void removeTask(TaskModel task) {
    _tasks = _tasks.where((t) => t != task).toList();
    _allTasks = _allTasks.where((t) => t != task).toList();
    _saveToStorage();
    notifyListeners();
  }

  updateSelectedPriority(String value) {
    _selectedPriority = value;
    notifyListeners();
  }

  updateSelectedTaskStatus(String value) {
    _selectedTaskStatus = value;
    notifyListeners();
  }

  void applyFilters() {
    final priority = _selectedPriority;
    final status = _selectedTaskStatus;
    _tasks = [
      for (final t in _allTasks)
        if ((priority == 'All' || t.priority.name == priority) &&
            (status == 'All' ||
                (status == 'Completed' && t.completed) ||
                (status == 'Todo' && !t.completed)))
          t
    ];
    notifyListeners();
  }

  void onClearFilter() {
    updateSelectedPriority("All");
    updateSelectedTaskStatus("All");
    _tasks = List.from(_allTasks);
    notifyListeners();
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  Future<void> _saveToStorage() async {
    var taskStorage = TaskStorage();
    var value = _allTasks.map((task) => task.toJson()).toList();
    await taskStorage.write({'tasks': value});
    await _loadFromStorage();
  }

  Future<void> _loadFromStorage({bool ascending = false}) async {
    var taskStorage = TaskStorage();
    var storedData = await taskStorage.read();
    if (storedData != null && storedData['tasks'] != null) {
      final List<dynamic> tasksList = storedData['tasks'];
      _allTasks = tasksList.map((json) => TaskModel.fromJson(json)).toList();
      _tasks = List.from(_allTasks);
      _tasks.sort((a, b) => ascending
          ? a.timeCreated!.compareTo(b.timeCreated!)
          : b.timeCreated!.compareTo(a.timeCreated!));
    }
    notifyListeners();
  }

  Future<void> _initializeTasks() async {
    await _loadFromStorage();
  }
}
