import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../models/todo_model.dart';

class TodoRemoteDataSource {
  final Dio dio;

  TodoRemoteDataSource(this.dio);

  Future<List<TodoModel>> getPosts() async {
    try {
      final response = await dio.get(
        ApiConstants.todos,
      );

      final List data = response.data;

      return data
          .map((json) => TodoModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw Exception(
        e.message ?? 'Something went wrong',
      );
    }
  }
}