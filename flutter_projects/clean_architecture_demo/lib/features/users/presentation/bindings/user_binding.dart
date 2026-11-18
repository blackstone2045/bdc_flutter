import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/datasourses/user_remote_data_source.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/usecases/get_users.dart';
import '../controllers/user_controller.dart';


class UserBinding extends Bindings {
  @override
  void dependencies() {
    // HTTP client
    Get.lazyPut<Dio>(
          () => DioClient().dio,
    );

    // Remote Data Source
    Get.lazyPut<UserRemoteDataSource>(
          () => UserRemoteDataSource(Get.find<Dio>()),
    );

    // Repository
    Get.lazyPut<UserRepository>(
          () => UserRepositoryImpl(
        Get.find<UserRemoteDataSource>(),
      ),
    );

    // Use Case
    Get.lazyPut<GetUsers>(
          () => GetUsers(
        Get.find<UserRepository>(),
      ),
    );

    // Controller
    Get.lazyPut<UserController>(
          () => UserController(
        Get.find<GetUsers>(),
      ),
    );
  }
}
