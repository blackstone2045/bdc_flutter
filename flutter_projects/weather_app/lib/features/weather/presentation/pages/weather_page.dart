import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/weather_controller.dart';

class WeatherPage extends GetView<WeatherController> {
  WeatherPage({super.key});

  final TextEditingController _cityController = TextEditingController(
    text: 'Dhaka',
  );

  String _formatTimestamp(int timestamp, int timezoneOffset) {
    if (timestamp == 0) return 'N/A';
    final date = DateTime.fromMillisecondsSinceEpoch(
      (timestamp + timezoneOffset) * 1000,
      isUtc: true,
    );
    return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(letterSpacing: 4, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.deepPurpleAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _cityController,
                      decoration: const InputDecoration(
                        hintText: 'Enter city name',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      onSubmitted: controller.fetchWeather,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton.filled(
                    onPressed: () =>
                        controller.fetchWeather(_cityController.text),
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (controller.errorMessage.isNotEmpty) {
                    return Center(
                      child: Text(
                        controller.errorMessage.value,
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    );
                  }
                  final data = controller.weather.value;
                  if (data == null) {
                    return const Center(child: Text('Search for a city'));
                  }
                  return RefreshIndicator(
                    onRefresh: () async {
                      final cityName = _cityController.text.trim().isEmpty
                          ? 'Dhaka'
                          : _cityController.text;
                      await controller.fetchWeather(cityName);
                    },
                    child: ListView(
                      children: [
                        // Main Header Card
                        Card(
                          color: Colors.purpleAccent[100],
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  '${data.cityName}, ${data.country}',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineMedium,
                                ),

                                Image.network(
                                  'https://openweathermap.org/img/wn/${data.iconCode}@2x.png',
                                ),
                                Text(
                                  '${data.temp.toStringAsFixed(1)}°C',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.displayMedium,
                                ),
                                Text(
                                  'Feels like ${data.feelsLike.toStringAsFixed(1)}°C • ${data.mainWeather} (${data.description})',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Detailed Information Card
                        Card(
                          color: Colors.white38,
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Detailed Metrics',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const Divider(),
                                _infoRow(
                                  'Temperature Range',
                                  'Min: ${data.tempMin}°C / Max: ${data.tempMax}°C',
                                ),
                                _infoRow('Humidity', '${data.humidity}%'),
                                _infoRow(
                                  'Pressure',
                                  '${data.pressure} hPa (Sea: ${data.seaLevel}, Grnd: ${data.grndLevel})',
                                ),
                                _infoRow(
                                  'Visibility',
                                  '${(data.visibility / 1000).toStringAsFixed(1)} km',
                                ),
                                _infoRow(
                                  'Wind',
                                  '${data.windSpeed} m/s, Deg: ${data.windDeg}°',
                                ),
                                _infoRow('Clouds', '${data.cloudsAll}%'),
                                _infoRow(
                                  'Coordinates',
                                  'Lon: ${data.lon}, Lat: ${data.lat}',
                                ),
                                _infoRow('Base Station', data.base),
                                _infoRow(
                                  'Sunrise',
                                  _formatTimestamp(data.sunrise, data.timezone),
                                ),
                                _infoRow(
                                  'Sunset',
                                  _formatTimestamp(data.sunset, data.timezone),
                                ),
                                _infoRow(
                                  'Timezone Offset',
                                  '${data.timezone / 3600} hours',
                                ),
                                _infoRow(
                                  'System Type/ID',
                                  'Type: ${data.sysType}, ID: ${data.sysId}',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
