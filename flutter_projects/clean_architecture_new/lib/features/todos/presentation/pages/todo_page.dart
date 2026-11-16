import 'package:flutter/material.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/datasource/todo_remote_data_source.dart';
import '../../data/repositories/todo_repository_impl.dart';
import '../../domain/entities/todo.dart';
import '../../domain/usecases/get_todos.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late final GetTodos getTodos;

  List<Todo> todos = [];

  bool isLoading = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();

    // Dependency initialization
    final dio = DioClient().dio;

    final remoteDataSource = TodoRemoteDataSource(dio);

    final repository = TodoRepositoryImpl(remoteDataSource);

    getTodos = GetTodos(repository);

    fetchTodos();
  }

  Future<void> fetchTodos() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final result = await getTodos();

      if (!mounted) return;

      setState(() {
        todos = result;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        errorMessage = e.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todos")),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (_, index) {
          final todo = todos[index];
          bool isCompleted = todo.completed;
          return ListTile(
            leading: Checkbox(
              value: isCompleted,
              onChanged: (value) {
                setState(() {
                  isCompleted != isCompleted;
                  print(isCompleted);
                });
              },
            ),
            title: Text(
              todo.title,
              style: TextStyle(
                color: isCompleted ? Colors.green : Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
