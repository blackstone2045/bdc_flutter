import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/task_controller.dart';

import '../widgets/task_card.dart';
import '../widgets/task_details_dialog.dart';
import '../widgets/task_form_dialog.dart';



class TaskPage extends GetView<TaskController> {
  const TaskPage({super.key});

  void openCreateDialog() {
    Get.dialog(
      const TaskFormDialog(),
    );
  }

  void openEditDialog(task) {
    Get.dialog(
      TaskFormDialog(task: task),
    );
  }

  Future<void> openDetails(String id) async {
    final task = await controller.fetchTaskById(id);

    if (task == null) return;

    Get.dialog(
      TaskDetailsDialog(task: task),
    );
  }

  void confirmDelete(String id) {
    Get.defaultDialog(
      title: 'Delete Task',

      middleText:
      'Are you sure you want to delete this task?',

      textCancel: 'Cancel',

      textConfirm: 'Delete',

      confirmTextColor: Colors.white,

      onConfirm: () {
        Get.back();

        controller.removeTask(id);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Management'),

        actions: [
          IconButton(
            onPressed: () {
              controller.fetchTasks(refresh: true);
            },

            icon: const Icon(Icons.refresh),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: openCreateDialog,

        child: const Icon(Icons.add),
      ),

      body: Obx(() {

        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.errorMessage.isNotEmpty &&
            controller.tasks.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                Text(controller.errorMessage.value),

                const SizedBox(height: 12),

                ElevatedButton(
                  onPressed: () {
                    controller.fetchTasks(refresh: true);
                  },

                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        if (controller.tasks.isEmpty) {
          return const Center(
            child: Text('No tasks available'),
          );
        }

        return RefreshIndicator(
          onRefresh: () {
            return controller.fetchTasks(refresh: true);
          },

          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),

            itemCount: controller.tasks.length + 1,

            itemBuilder: (context, index) {

              if (index == controller.tasks.length) {
                if (!controller.hasMore) {
                  return const SizedBox(height: 80);
                }

                return Padding(
                  padding: const EdgeInsets.all(16),

                  child: Center(
                    child: ElevatedButton(
                      onPressed: controller.isLoadingMore.value
                          ? null
                          : controller.loadMoreTasks,

                      child: controller.isLoadingMore.value
                          ? const CircularProgressIndicator()
                          : const Text('Load More'),
                    ),
                  ),
                );
              }

              final task = controller.tasks[index];

              return TaskCard(
                task: task,

                onEdit: () {
                  openEditDialog(task);
                },

                onDelete: () {
                  confirmDelete(task.id);
                },

                onDetails: () {
                  openDetails(task.id);
                },
              );
            },
          ),
        );
      }),
    );
  }
}
