import '../../domain/entities/weather.dart';

class WeatherModel extends Weather {
  const WeatherModel({
    required super.lon,
    required super.lat,
    required super.weatherId,
    required super.mainWeather,
    required super.description,
    required super.iconCode,
    required super.base,
    required super.temp,
    required super.feelsLike,
    required super.tempMin,
    required super.tempMax,
    required super.pressure,
    required super.humidity,
    required super.seaLevel,
    required super.grndLevel,
    required super.visibility,
    required super.windSpeed,
    required super.windDeg,
    required super.cloudsAll,
    required super.dt,
    required super.sysType,
    required super.sysId,
    required super.country,
    required super.sunrise,
    required super.sunset,
    required super.timezone,
    required super.id,
    required super.cityName,
    required super.cod,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final coord = json['coord'] ?? {};
    final weatherList = json['weather'] as List<dynamic>? ?? [];
    final weatherItem = weatherList.isNotEmpty ? weatherList[0] : {};
    final main = json['main'] ?? {};
    final wind = json['wind'] ?? {};
    final clouds = json['clouds'] ?? {};
    final sys = json['sys'] ?? {};

    return WeatherModel(
      lon: (coord['lon'] as num?)?.toDouble() ?? 0.0,
      lat: (coord['lat'] as num?)?.toDouble() ?? 0.0,
      weatherId: (weatherItem['id'] as num?)?.toInt() ?? 0,
      mainWeather: weatherItem['main'] ?? '',
      description: weatherItem['description'] ?? '',
      iconCode: weatherItem['icon'] ?? '01d',
      base: json['base'] ?? '',
      temp: (main['temp'] as num?)?.toDouble() ?? 0.0,
      feelsLike: (main['feels_like'] as num?)?.toDouble() ?? 0.0,
      tempMin: (main['temp_min'] as num?)?.toDouble() ?? 0.0,
      tempMax: (main['temp_max'] as num?)?.toDouble() ?? 0.0,
      pressure: (main['pressure'] as num?)?.toInt() ?? 0,
      humidity: (main['humidity'] as num?)?.toInt() ?? 0,
      seaLevel: (main['sea_level'] as num?)?.toInt() ?? 0,
      grndLevel: (main['grnd_level'] as num?)?.toInt() ?? 0,
      visibility: (json['visibility'] as num?)?.toInt() ?? 0,
      windSpeed: (wind['speed'] as num?)?.toDouble() ?? 0.0,
      windDeg: (wind['deg'] as num?)?.toInt() ?? 0,
      cloudsAll: (clouds['all'] as num?)?.toInt() ?? 0,
      dt: (json['dt'] as num?)?.toInt() ?? 0,
      sysType: (sys['type'] as num?)?.toInt() ?? 0,
      sysId: (sys['id'] as num?)?.toInt() ?? 0,
      country: sys['country'] ?? '',
      sunrise: (sys['sunrise'] as num?)?.toInt() ?? 0,
      sunset: (sys['sunset'] as num?)?.toInt() ?? 0,
      timezone: (json['timezone'] as num?)?.toInt() ?? 0,
      id: (json['id'] as num?)?.toInt() ?? 0,
      cityName: json['name'] ?? '',
      cod: (json['cod'] as num?)?.toInt() ?? 200,
    );
  }
}
