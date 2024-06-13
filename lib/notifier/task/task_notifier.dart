import 'package:check_list_app/model/priority_model/priority_model.dart';
import 'package:check_list_app/model/task_model/task_model.dart';
import 'package:check_list_app/service/storage/task_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, List<TaskModel>>(
    (ref) => TaskNotifier());

class TaskNotifier extends StateNotifier<List<TaskModel>> {
  TaskNotifier() : super([]) {
    _initializeTasks();
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

  void _initializeTasks() async {
    var taskStorage = TaskStorage();
    var storedData = await taskStorage.read();

    if (storedData == null || storedData['tasks'] == null) {
      List<TaskModel> initialTasks = [
        TaskModel(
            name: 'Water the plants',
            completed: false,
            priority: PriorityModel(id: '1', name: 'Normal', color: '#fcba03')),
        TaskModel(
            name: 'Mom’s birthday 🎂',
            completed: false,
            priority: PriorityModel(id: '2', name: 'Medium', color: '#fc7b03')),
        TaskModel(
            name: 'Dinner w/ friends',
            completed: false,
            priority: PriorityModel(id: '1', name: 'Normal', color: '#fcba03')),
        TaskModel(
            name: 'Pay bill 1',
            completed: false,
            priority: PriorityModel(id: '3', name: 'High', color: '#cc0404')),
        TaskModel(
            name: 'Work event',
            completed: false,
            priority: PriorityModel(id: '2', name: 'Medium', color: '#fc7b03')),
        TaskModel(
            name: 'Pay bill 2',
            completed: false,
            priority: PriorityModel(id: '1', name: 'Normal', color: '#fcba03')),
        TaskModel(
            name: 'Grocery shopping',
            completed: false,
            priority: PriorityModel(id: '2', name: 'Medium', color: '#fc7b03')),
        TaskModel(
            name: 'Call the doctor',
            completed: false,
            priority: PriorityModel(id: '3', name: 'High', color: '#cc0404')),
        TaskModel(
            name: 'Clean the house',
            completed: false,
            priority: PriorityModel(id: '1', name: 'Normal', color: '#fcba03')),
        TaskModel(
            name: 'Finish project report',
            completed: false,
            priority: PriorityModel(id: '3', name: 'High', color: '#cc0404')),
      ];
      state = initialTasks;
      _saveToStorage();
    } else {
      _loadFromStorage();
    }
  }
}
