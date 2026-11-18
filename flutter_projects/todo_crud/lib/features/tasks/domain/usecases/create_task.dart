import '../entities/task.dart';
import '../entities/task_request.dart';
import '../repositories/task_repository.dart';

class CreateTask {
  final TaskRepository repository;

  CreateTask(this.repository);

  Future<Task> call(TaskRequest request) {
    return repository.createTask(request);
  }
}
