class Weather {
  final double lon;
  final double lat;
  final int weatherId;
  final String mainWeather;
  final String description;
  final String iconCode;
  final String base;
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final int seaLevel;
  final int grndLevel;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final int cloudsAll;
  final int dt;
  final int sysType;
  final int sysId;
  final String country;
  final int sunrise;
  final int sunset;
  final int timezone;
  final int id;
  final String cityName;
  final int cod;

  const Weather({
    required this.lon,
    required this.lat,
    required this.weatherId,
    required this.mainWeather,
    required this.description,
    required this.iconCode,
    required this.base,
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.cloudsAll,
    required this.dt,
    required this.sysType,
    required this.sysId,
    required this.country,
    required this.sunrise,
    required this.sunset,
    required this.timezone,
    required this.id,
    required this.cityName,
    required this.cod,
  });
}
