import 'package:check_list_app/model/form/form_model.dart';
import 'package:check_list_app/model/priority_model/priority_model.dart';
import 'package:check_list_app/model/task_model/task_model.dart';
import 'package:check_list_app/notifier/task/task_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormStateNotifier extends ChangeNotifier {
  FormStateModel _formState = FormStateModel();
  final FormStateModel formState1 = FormStateModel();
  FormAction _formAction = FormAction.ADD;
  final Ref ref;

  FormStateNotifier(this.ref);

  FormStateModel get formState => _formState;

  FormAction get formAction => _formAction;

  void updateTitle(String title) {
    _formState = _formState.copyWith(title: title);
    notifyListeners();
  }

  void updateDescription(String description) {
    _formState = _formState.copyWith(description: description);
    notifyListeners();
  }

  void updatePriority(String priority) {
    _formState = _formState.copyWith(priority: priority);
    notifyListeners();
  }

  void perpuseNavigate(FormAction purpose) {
    _formAction = purpose;
  }

  void saveForm(BuildContext context) {
    if (_formState.title.isNotEmpty &&
        _formState.description.isNotEmpty &&
        _formState.priority.isNotEmpty) {
      final now = DateTime.now();
      final task = TaskModel(
        name: _formState.title,
        completed: false,
        priority: PriorityModel(
          id: getPriorityId(_formState.priority),
          name: _formState.priority,
          color: priorityColors[_formState.priority] ?? '#000000',
        ),
        dateTime: now,
        description: _formState.description,
        timeCreated: _formState.timeCreated ?? now,
        timeUpdated: now,
      );

      ref.read(taskProvider.notifier).addTask(task);

      resetFormState(now);
      showSnackBar(context, 'Form saved');
      Navigator.of(context).pop(); // Navigate back to the previous screen
    }
  }

  void editTask(BuildContext context, TaskModel originalTask) {
    if (_formState.title.isNotEmpty &&
        _formState.description.isNotEmpty &&
        _formState.priority.isNotEmpty) {
      final now = DateTime.now();
      final updatedTask = originalTask.copyWith(
        name: _formState.title,
        priority: PriorityModel(
          id: getPriorityId(_formState.priority),
          name: _formState.priority,
          color: priorityColors[_formState.priority] ?? '#000000',
        ),
        description: _formState.description,
        timeUpdated: now,
      );

      ref.read(taskProvider.notifier).updateTask(updatedTask);

      resetFormState();
      showSnackBar(context, 'Task updated');
      Navigator.of(context).pop(); // Navigate back to the previous screen
    }
  }

  void populateForm(TaskModel task) {
    _formState = FormStateModel(
      title: task.name,
      description: task.description,
      priority: task.priority.name,
      timeCreated: task.timeCreated,
      timeUpdated: task.timeUpdated,
    );
    notifyListeners();
  }

  void resetFormState([DateTime? now]) {
    _formState = _formState.copyWith(
      timeUpdated: now,
      timeCreated: _formState.timeCreated ?? now,
    );
    _formState = FormStateModel();
    notifyListeners();
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  String getPriorityId(String priorityName) {
    switch (priorityName) {
      case 'Normal':
        return '1';
      case 'Medium':
        return '2';
      case 'High':
        return '3';
      default:
        return '1';
    }
  }
}

const priorityColors = {
  'Normal': '#fcba03',
  'Medium': '#fc7b03',
  'High': '#cc0404',
};

final formStateProvider = ChangeNotifierProvider<FormStateNotifier>((ref) {
  return FormStateNotifier(ref);
});

enum FormAction {
  ADD,
  EDIT,
}
