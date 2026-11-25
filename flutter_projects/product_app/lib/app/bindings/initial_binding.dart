import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/storage/token_storage.dart';
import '../../core/network/dio_client.dart';

import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';

import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/register_user.dart';
import '../../features/auth/domain/usecases/login_user.dart';
import '../../features/auth/domain/usecases/get_current_user.dart';
import '../../features/auth/domain/usecases/logout_user.dart';

import '../../features/auth/presentation/controllers/auth_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GetStorage(), permanent: true);

    Get.put(
      TokenStorage(Get.find<GetStorage>()),
      permanent: true,
    );

    Get.put(
      DioClient(Get.find<TokenStorage>()),
      permanent: true,
    );

    Get.put(
      AuthRemoteDataSource(
        Get.find<DioClient>().dio,
      ),
      permanent: true,
    );

    Get.put<AuthRepository>(
      AuthRepositoryImpl(
        remoteDataSource: Get.find<AuthRemoteDataSource>(),
        tokenStorage: Get.find<TokenStorage>(),
      ),
      permanent: true,
    );

    Get.put(
      RegisterUser(Get.find<AuthRepository>()),
      permanent: true,
    );

    Get.put(
      LoginUser(Get.find<AuthRepository>()),
      permanent: true,
    );

    Get.put(
      GetCurrentUser(Get.find<AuthRepository>()),
      permanent: true,
    );

    Get.put(
      LogoutUser(Get.find<AuthRepository>()),
      permanent: true,
    );

    Get.put(
      AuthController(
        registerUser: Get.find<RegisterUser>(),
        loginUser: Get.find<LoginUser>(),
        getCurrentUser: Get.find<GetCurrentUser>(),
        logoutUser: Get.find<LogoutUser>(),
        tokenStorage: Get.find<TokenStorage>(),
      ),
      permanent: true,
    );
  }
}
