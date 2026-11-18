import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/task.dart';
import '../../domain/entities/task_request.dart';

import '../controllers/task_controller.dart';

class TaskFormDialog extends StatefulWidget {
  final Task? task;

  const TaskFormDialog({
    super.key,
    this.task,
  });

  @override
  State<TaskFormDialog> createState() =>
      _TaskFormDialogState();
}

class _TaskFormDialogState extends State<TaskFormDialog> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  late final TextEditingController statusController;

  final TaskController controller = Get.find<TaskController>();

  bool get isEditing => widget.task != null;

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(
      text: widget.task?.title ?? '',
    );

    descriptionController = TextEditingController(
      text: widget.task?.description ?? '',
    );

    statusController = TextEditingController(
      text: widget.task?.status ?? 'PENDING',
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    statusController.dispose();

    super.dispose();
  }

  Future<void> submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final request = TaskRequest(
      title: titleController.text.trim(),
      description: descriptionController.text.trim(),
      status: statusController.text.trim().toUpperCase(),
    );

    if (isEditing) {
      await controller.editTask(
        widget.task!.id,
        request,
      );
    } else {
      await controller.addTask(request);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        isEditing ? 'Update Task' : 'Create Task',
      ),

      content: Form(
        key: _formKey,

        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [

              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Task Title',
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a title';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),

                maxLines: 3,

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a description';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: statusController,
                decoration: const InputDecoration(
                  labelText: 'Status',
                  helperText: 'Example: PENDING',
                  border: OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a status';
                  }

                  return null;
                },
              ),
            ],
          ),
        ),
      ),

      actions: [

        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),

        Obx(() {
          return ElevatedButton(
            onPressed: controller.isSubmitting.value
                ? null
                : submit,

            child: controller.isSubmitting.value
                ? const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
                : Text(
              isEditing ? 'Update' : 'Create',
            ),
          );
        }),
      ],
    );
  }
}
