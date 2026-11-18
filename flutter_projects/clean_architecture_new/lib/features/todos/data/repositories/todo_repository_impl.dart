import 'package:clean_architecture_demo/features/todos/data/datasource/todo_remote_data_source.dart';
import 'package:clean_architecture_demo/features/todos/domain/entities/todo.dart';
import 'package:clean_architecture_demo/features/todos/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource remoteDataSource;

  TodoRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Todo>> getTodos() async {
    return await remoteDataSource.getPosts();
  }
}