import '../entities/task_page.dart';
import '../repositories/task_repository.dart';

class GetTasks {
  final TaskRepository repository;

  GetTasks(this.repository);

  Future<TaskPage> call({
    required int page,
    required int limit,
  }) {
    return repository.getTasks(
      page: page,
      limit: limit,
    );
  }
}
