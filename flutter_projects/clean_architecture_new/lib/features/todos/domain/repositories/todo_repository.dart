import '../entities/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> getTodos();
}