import 'package:dio/dio.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/errors/api_exception.dart';

import '../models/task_model.dart';
import '../../domain/entities/task_request.dart';
import '../../domain/entities/task_page.dart';

class TaskRemoteDataSource {
  final Dio dio;

  TaskRemoteDataSource(this.dio);

  // GET ALL TASKS

  Future<TaskPage> getTasks({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await dio.get(
        ApiConstants.tasks,
        queryParameters: {
          'page': page,
          'limit': limit,
        },
      );

      final data = response.data;

      final List<dynamic> taskList = data['data'];

      final meta = data['meta'];

      return TaskPage(
        tasks: taskList
            .map(
              (json) => TaskModel.fromJson(
            Map<String, dynamic>.from(json),
          ),
        )
            .toList(),
        page: meta['page'],
        limit: meta['limit'],
        total: meta['total'],
        totalPage: meta['totalPage'],
      );

    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  // GET TASK BY ID

  Future<TaskModel> getTaskById(String id) async {
    try {
      final response = await dio.get(
        '${ApiConstants.tasks}/$id',
      );

      return TaskModel.fromJson(
        Map<String, dynamic>.from(response.data['data']),
      );

    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  // CREATE TASK

  Future<TaskModel> createTask(TaskRequest request) async {
    try {
      final response = await dio.post(
        ApiConstants.tasks,
        data: {
          'title': request.title,
          'description': request.description,
          'status': request.status,
        },
      );

      return TaskModel.fromJson(
        Map<String, dynamic>.from(response.data['data']),
      );

    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  // UPDATE TASK

  Future<TaskModel> updateTask(
      String id,
      TaskRequest request,
      ) async {
    try {
      final response = await dio.patch(
        '${ApiConstants.tasks}/$id',
        data: {
          'title': request.title,
          'description': request.description,
          'status': request.status,
        },
      );

      return TaskModel.fromJson(
        Map<String, dynamic>.from(response.data['data']),
      );

    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }

  // DELETE TASK

  Future<TaskModel> deleteTask(String id) async {
    try {
      final response = await dio.delete(
        '${ApiConstants.tasks}/$id',
      );

      return TaskModel.fromJson(
        Map<String, dynamic>.from(response.data['data']),
      );

    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    }
  }
}
