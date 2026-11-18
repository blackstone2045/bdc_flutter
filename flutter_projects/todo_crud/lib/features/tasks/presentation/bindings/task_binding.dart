import 'package:get/get.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/dio_client.dart';

import '../../data/datasources/task_remote_data_source.dart';
import '../../data/repositories/task_repository_impl.dart';

import '../../domain/repositories/task_repository.dart';

import '../../domain/usecases/get_tasks.dart';
import '../../domain/usecases/get_task_by_id.dart';
import '../../domain/usecases/create_task.dart';
import '../../domain/usecases/update_task.dart';
import '../../domain/usecases/delete_task.dart';

import '../controllers/task_controller.dart';

class TaskBinding extends Bindings {
  @override
  void dependencies() {

    // Dio Client

    Get.lazyPut<Dio>(
          () => DioClient().dio,
    );

    // Data Source

    Get.lazyPut<TaskRemoteDataSource>(
          () => TaskRemoteDataSource(
        Get.find<Dio>(),
      ),
    );

    // Repository

    Get.lazyPut<TaskRepository>(
          () => TaskRepositoryImpl(
        Get.find<TaskRemoteDataSource>(),
      ),
    );

    // Use Cases

    Get.lazyPut<GetTasks>(
          () => GetTasks(
        Get.find<TaskRepository>(),
      ),
    );

    Get.lazyPut<GetTaskById>(
          () => GetTaskById(
        Get.find<TaskRepository>(),
      ),
    );

    Get.lazyPut<CreateTask>(
          () => CreateTask(
        Get.find<TaskRepository>(),
      ),
    );

    Get.lazyPut<UpdateTask>(
          () => UpdateTask(
        Get.find<TaskRepository>(),
      ),
    );

    Get.lazyPut<DeleteTask>(
          () => DeleteTask(
        Get.find<TaskRepository>(),
      ),
    );

    // Controller

    Get.lazyPut<TaskController>(
          () => TaskController(
        getTasks: Get.find<GetTasks>(),
        getTaskById: Get.find<GetTaskById>(),
        createTask: Get.find<CreateTask>(),
        updateTask: Get.find<UpdateTask>(),
        deleteTask: Get.find<DeleteTask>(),
      ),
    );
  }
}
