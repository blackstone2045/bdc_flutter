import 'package:get/get.dart';

import '../../domain/entities/task.dart';
import '../../domain/entities/task_request.dart';

import '../../domain/usecases/get_tasks.dart';
import '../../domain/usecases/get_task_by_id.dart';
import '../../domain/usecases/create_task.dart';
import '../../domain/usecases/update_task.dart';
import '../../domain/usecases/delete_task.dart';

class TaskController extends GetxController {

  final GetTasks getTasks;
  final GetTaskById getTaskById;
  final CreateTask createTask;
  final UpdateTask updateTask;
  final DeleteTask deleteTask;

  TaskController({
    required this.getTasks,
    required this.getTaskById,
    required this.createTask,
    required this.updateTask,
    required this.deleteTask,
  });

  // Reactive variables

  final RxList<Task> tasks = <Task>[].obs;

  final RxBool isLoading = false.obs;

  final RxBool isSubmitting = false.obs;

  final RxBool isLoadingMore = false.obs;

  final RxString errorMessage = ''.obs;

  final Rxn<Task> selectedTask = Rxn<Task>();

  // Pagination

  int currentPage = 1;

  int limit = 10;

  int totalPage = 1;

  bool get hasMore => currentPage < totalPage;

  @override
  void onInit() {
    super.onInit();

    fetchTasks();
  }

  // GET ALL TASKS

  Future<void> fetchTasks({
    bool refresh = false,
  }) async {
    if (isLoading.value) return;

    if (refresh) {
      currentPage = 1;
    }

    try {
      isLoading.value = true;

      errorMessage.value = '';

      final result = await getTasks(
        page: currentPage,
        limit: limit,
      );

      tasks.assignAll(result.tasks);

      currentPage = result.page;

      totalPage = result.totalPage;

    } catch (e) {
      errorMessage.value = e.toString();

    } finally {
      isLoading.value = false;
    }
  }

  // LOAD MORE TASKS

  Future<void> loadMoreTasks() async {
    if (!hasMore ||
        isLoadingMore.value ||
        isLoading.value) {
      return;
    }

    try {
      isLoadingMore.value = true;

      final nextPage = currentPage + 1;

      final result = await getTasks(
        page: nextPage,
        limit: limit,
      );

      tasks.addAll(result.tasks);

      currentPage = result.page;

      totalPage = result.totalPage;

    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
      );

    } finally {
      isLoadingMore.value = false;
    }
  }

  // GET TASK BY ID

  Future<Task?> fetchTaskById(String id) async {
    try {
      final result = await getTaskById(id);

      selectedTask.value = result;

      return result;

    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
      );

      return null;
    }
  }

  // CREATE TASK

  Future<bool> addTask(TaskRequest request) async {
    try {
      isSubmitting.value = true;

      await createTask(request);

      Get.back();

      Get.snackbar(
        'Success',
        'Task created successfully',
      );

      await fetchTasks(refresh: true);

      return true;

    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
      );

      return false;

    } finally {
      isSubmitting.value = false;
    }
  }

  // UPDATE TASK

  Future<bool> editTask(
      String id,
      TaskRequest request,
      ) async {
    try {
      isSubmitting.value = true;

      await updateTask(id, request);

      Get.back();

      Get.snackbar(
        'Success',
        'Task updated successfully',
      );

      await fetchTasks(refresh: true);

      return true;

    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
      );

      return false;

    } finally {
      isSubmitting.value = false;
    }
  }

  // DELETE TASK

  Future<void> removeTask(String id) async {
    try {
      await deleteTask(id);

      tasks.removeWhere(
            (task) => task.id == id,
      );

      Get.snackbar(
        'Success',
        'Task deleted successfully',
      );

      // Reload current page if it became empty.
      if (tasks.isEmpty && currentPage > 1) {
        currentPage--;
        await fetchTasks();
      }

    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
      );
    }
  }
}
