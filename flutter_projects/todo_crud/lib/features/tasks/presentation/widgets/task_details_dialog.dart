import 'package:flutter/material.dart';

import '../../domain/entities/task.dart';

class TaskDetailsDialog extends StatelessWidget {
  final Task task;

  const TaskDetailsDialog({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Task Details'),

      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          mainAxisSize: MainAxisSize.min,

          children: [
            Text('ID: ${task.id}'),

            const SizedBox(height: 10),

            Text('Title: ${task.title}'),

            const SizedBox(height: 10),

            Text('Description: ${task.description}'),

            const SizedBox(height: 10),

            Text('Status: ${task.status}'),

            const SizedBox(height: 10),

            Text(
              'Created: ${task.createdAt?.toLocal() ?? 'N/A'}',
            ),

            const SizedBox(height: 10),

            Text(
              'Updated: ${task.updatedAt?.toLocal() ?? 'N/A'}',
            ),
          ],
        ),
      ),

      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
