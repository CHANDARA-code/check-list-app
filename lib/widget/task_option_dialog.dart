import 'package:check_list_app/model/task_model/task_model.dart';
import 'package:check_list_app/notifier/form/form_state_notifier.dart';
import 'package:check_list_app/widget/app_button.dart';
import 'package:check_list_app/widget/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TaskOptionsDialog extends HookConsumerWidget {
  final TaskModel task;

  const TaskOptionsDialog({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AnimationController _controller = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    _controller.forward();
    return FadeTransition(
      opacity: _controller.drive(
        CurveTween(curve: Curves.easeInOut),
      ),
      child: Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize
                .min, // Ensure the dialog is only as tall as it needs to be
            children: [
              const Text(
                'Task Options',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20), // Spacing between title and buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppButton(
                    iconData: Icons.edit,
                    label: 'Edit',
                    backgroundColor: Colors.blue, // Background color
                    foregroundColor: Colors.white, // Text color
                    onPressed: () {
                      ref
                          .read(formStateProvider)
                          .perpuseNavigate(FormAction.EDIT);
                      ref.read(formStateProvider).populateForm(task);
                      context.push('/details', extra: task);
                      Navigator.of(context).pop();
                    },
                  ),
                  AppButton(
                    iconData: Icons.delete,
                    label: 'Delete',
                    backgroundColor: Colors.red, // Background color
                    foregroundColor: Colors.white, // Text color
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ConfirmDeleteDialog(task: task);
                        },
                      ).then((value) {
                        if (value == true) {
                          Navigator.of(context).pop(true);
                        }
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
