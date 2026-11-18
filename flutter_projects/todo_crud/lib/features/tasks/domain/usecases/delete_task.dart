import '../entities/task.dart';
import '../repositories/task_repository.dart';

class DeleteTask {
  final TaskRepository repository;

  DeleteTask(this.repository);

  Future<Task> call(String id) {
    return repository.deleteTask(id);
  }
}
