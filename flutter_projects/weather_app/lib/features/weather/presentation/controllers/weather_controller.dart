import 'package:get/get.dart';

import '../../domain/entities/weather.dart';
import '../../domain/usecases/get_current_weather.dart';

class WeatherController extends GetxController {
  final GetCurrentWeather getCurrentWeather;

  WeatherController(this.getCurrentWeather);

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final Rxn<Weather> weather = Rxn<Weather>();
  //final RxList<Weather> weather = <Weather>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchWeather('Dhaka');
  }

  Future<void> fetchWeather(String city) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await getCurrentWeather(city);

      weather.value = result;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  //
  // Future<void> fetchWeather(String city) async {
  //   if (city.trim().isEmpty) return;
  //
  //   isLoading.value = true;
  //   errorMessage.value = '';
  //
  //   final data = await getCurrentWeather(city.trim());
  //
  //   if (failure != null) {
  //     errorMessage.value = failure.message;
  //     weather.value = null;
  //   } else {
  //     weather.value = data;
  //   }
  //
  //   isLoading.value = false;
  // }
}
