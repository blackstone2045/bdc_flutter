import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasource/todo_remote_data_source.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource remoteDataSource;

  TodoRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Todo>> getTodos() async {
    return await remoteDataSource.getPosts();
  }
}
