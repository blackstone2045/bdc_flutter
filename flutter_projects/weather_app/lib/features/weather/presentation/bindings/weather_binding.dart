import 'package:get/get.dart';

import '../../../../core/network/dio_client.dart';
import '../../data/datasources/weather_remote_datasource.dart';
import '../../data/repositories/weather_repository_impl.dart';
import '../../domain/repositories/weather_repository.dart';
import '../../domain/usecases/get_current_weather.dart';
import '../controllers/weather_controller.dart';

class WeatherBinding extends Bindings {
  @override
  void dependencies() {
    // 1. Core Network Client
    Get.lazyPut<DioClient>(() => DioClient());

    // 2. Data Source (Binding implementation to interface)
    Get.lazyPut<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(Get.find<DioClient>()),
    );

    // 3. Repository (Binding implementation to interface)
    Get.lazyPut<WeatherRepository>(
      () => WeatherRepositoryImpl(Get.find<WeatherRemoteDataSource>()),
    );

    // 4. Use Case
    Get.lazyPut<GetCurrentWeather>(
      () => GetCurrentWeather(Get.find<WeatherRepository>()),
    );

    // 5. Controller
    Get.lazyPut<WeatherController>(
      () => WeatherController(Get.find<GetCurrentWeather>()),
    );
  }
}
