import 'package:check_list_app/model/priority_model/priority_model.dart';
import 'package:check_list_app/model/task_model/task_model.dart';
import 'package:check_list_app/notifier/task/task_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:check_list_app/utils/base_storages/base_storage.dart';

class MockTaskStorage extends Mock implements BaseStorage {
  @override
  String key() {
    return 'task';
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late TaskNotifier taskNotifier;
  late MockTaskStorage mockTaskStorage;

  setUp(() {
    mockTaskStorage = MockTaskStorage();
    taskNotifier = TaskNotifier();
  });

  test('Initial task list is empty', () {
    expect(taskNotifier.tasks, isEmpty);
  });

  test('Add task to the list', () {
    final task = TaskModel(
      name: 'New Task',
      completed: false,
      priority: PriorityModel(id: '1', name: 'Normal', color: '#fcba03'),
      dateTime: DateTime.now(),
      description: 'Description',
      timeCreated: DateTime.now(),
      timeUpdated: DateTime.now(),
    );

    taskNotifier.addTask(task);

    expect(taskNotifier.tasks, contains(task));
  });

  test('Update an existing task', () {
    final task = TaskModel(
      name: 'New Task',
      completed: false,
      priority: PriorityModel(id: '1', name: 'Normal', color: '#fcba03'),
      dateTime: DateTime.now(),
      description: 'Description',
      timeCreated: DateTime.now(),
      timeUpdated: DateTime.now(),
    );

    taskNotifier.addTask(task);

    final updatedTask = task.copyWith(name: 'Updated Task');
    taskNotifier.updateTask(updatedTask);

    expect(taskNotifier.tasks.any((t) => t.name == 'Updated Task'), isTrue);
  });

  test('Toggle task completion', () {
    final task = TaskModel(
      name: 'New Task',
      completed: false,
      priority: PriorityModel(id: '1', name: 'Normal', color: '#fcba03'),
      dateTime: DateTime.now(),
      description: 'Description',
      timeCreated: DateTime.now(),
      timeUpdated: DateTime.now(),
    );

    taskNotifier.addTask(task);
    taskNotifier.toggleTaskCompletion(task);

    expect(taskNotifier.tasks.first.completed, isTrue);
  });

  test('Remove task from the list', () {
    final task = TaskModel(
      name: 'New Task',
      completed: false,
      priority: PriorityModel(id: '1', name: 'Normal', color: '#fcba03'),
      dateTime: DateTime.now(),
      description: 'Description',
      timeCreated: DateTime.now(),
      timeUpdated: DateTime.now(),
    );

    taskNotifier.addTask(task);
    taskNotifier.removeTask(task);

    expect(taskNotifier.tasks, isNot(contains(task)));
  });

  test('Clear filters and restore initial tasks', () {
    final task1 = TaskModel(
      name: 'Task 1',
      completed: false,
      priority: PriorityModel(id: '1', name: 'Normal', color: '#fcba03'),
      dateTime: DateTime.now().subtract(Duration(days: 1)),
      description: 'Description 1',
      timeCreated: DateTime.now().subtract(Duration(days: 1)),
      timeUpdated: DateTime.now().subtract(Duration(days: 1)),
    );

    final task2 = TaskModel(
      name: 'Task 2',
      completed: true,
      priority: PriorityModel(id: '2', name: 'Medium', color: '#fc7b03'),
      dateTime: DateTime.now().subtract(Duration(days: 2)),
      description: 'Description 2',
      timeCreated: DateTime.now().subtract(Duration(days: 2)),
      timeUpdated: DateTime.now().subtract(Duration(days: 2)),
    );

    taskNotifier.addTask(task1);
    taskNotifier.addTask(task2);

    taskNotifier.applyFilters();
    taskNotifier.onClearFilter();

    expect(taskNotifier.tasks, contains(task1));
    expect(taskNotifier.tasks, contains(task2));
  });
}
