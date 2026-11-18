import '../../domain/entities/weather.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/weather_remote_datasource.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDtaSource;

  WeatherRepositoryImpl(this.remoteDtaSource);
  @override
  Future<Weather> getWeatherByCity(String cityName) async {
    return await remoteDtaSource.fetchWeatherByCity(cityName);
  }
}
