import 'task.dart';

class TaskPage {
  final List<Task> tasks;
  final int page;
  final int limit;
  final int total;
  final int totalPage;

  const TaskPage({
    required this.tasks,
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPage,
  });
}
