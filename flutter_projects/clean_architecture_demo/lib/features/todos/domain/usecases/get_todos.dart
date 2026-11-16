import 'package:clean_architecture_demo/features/todos/domain/entities/todo.dart';
import 'package:clean_architecture_demo/features/todos/domain/repositories/todo_repository.dart';



class GetTodos {
  final TodoRepository repository;

  GetTodos(this.repository);

  Future<List<Todo>> call() {
    return repository.getTodos();
  }
}