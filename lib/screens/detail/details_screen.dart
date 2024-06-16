import 'package:check_list_app/model/task_model/task_model.dart';
import 'package:check_list_app/notifier/form/form_state_notifier.dart';
import 'package:check_list_app/widget/app_text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailsScreen extends HookConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final TaskModel? originalTask;

  DetailsScreen({Key? key, this.originalTask}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formStateNotifier = ref.watch(formStateProvider);
    final formState = formStateNotifier.formState;

    useEffect(() {
      if (originalTask != null && formState.title.isEmpty) {
        Future.microtask(() => formStateNotifier.populateForm(originalTask!));
      }
      return null;
    }, [originalTask, formState.title]);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Form with Riverpod'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppTextInput(
                initialValue: formState.title,
                labelText: 'Title',
                onChanged: (value) =>
                    ref.read(formStateProvider).updateTitle(value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                style: TextStyle(fontSize: 18.0, color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              AppTextInput(
                initialValue: formState.description,
                labelText: 'Description',
                onChanged: (value) =>
                    ref.read(formStateProvider).updateDescription(value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                style: TextStyle(fontSize: 18.0, color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: formState.priority.isEmpty ? null : formState.priority,
                decoration: InputDecoration(labelText: 'Priority'),
                items: ['Normal', 'Medium', 'High'].map((String priority) {
                  return DropdownMenuItem<String>(
                    value: priority,
                    child: Text(priority),
                  );
                }).toList(),
                onChanged: (newValue) =>
                    ref.read(formStateProvider).updatePriority(newValue!),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a priority';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                icon: Icon(Icons.save),
                label: Text('Save'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (originalTask != null) {
                      // Editing an existing task
                      ref
                          .read(formStateProvider)
                          .editTask(context, originalTask!);
                    } else {
                      // Creating a new task
                      ref.read(formStateProvider).saveForm(context);
                    }
                  }
                },
              ),
              SizedBox(height: 20),
              if (formState.timeCreated != null)
                Text('Time Created: ${formState.agoCreated}'),
              if (formState.timeUpdated != null)
                Text('Time Updated: ${formState.agoUpdated}'),
            ],
          ),
        ),
      ),
    );
  }
}
