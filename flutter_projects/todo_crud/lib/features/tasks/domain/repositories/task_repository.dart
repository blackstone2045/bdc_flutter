import '../entities/task.dart';
import '../entities/task_request.dart';
import '../entities/task_page.dart';

abstract class TaskRepository {

  Future<TaskPage> getTasks({
    required int page,
    required int limit,
  });

  Future<Task> getTaskById(String id);

  Future<Task> createTask(TaskRequest request);

  Future<Task> updateTask(
      String id,
      TaskRequest request,
      );

  Future<Task> deleteTask(String id);
}
