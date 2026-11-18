import '../../../../core/constants/api_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> fetchWeatherByCity(String cityName);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final DioClient client;

  WeatherRemoteDataSourceImpl(this.client);

  @override
  Future<WeatherModel> fetchWeatherByCity(String cityName) async {
    final response = await client.dio.get(
      ApiConstants.currentWeather,
      queryParameters: {'q': cityName},
    );
    return WeatherModel.fromJson(response.data);
  }
}
