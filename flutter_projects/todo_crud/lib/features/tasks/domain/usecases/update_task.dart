import '../entities/task.dart';
import '../entities/task_request.dart';
import '../repositories/task_repository.dart';

class UpdateTask {
  final TaskRepository repository;

  UpdateTask(this.repository);

  Future<Task> call(
      String id,
      TaskRequest request,
      ) {
    return repository.updateTask(id, request);
  }
}
