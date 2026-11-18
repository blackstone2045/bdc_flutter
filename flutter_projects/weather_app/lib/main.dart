import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/weather/presentation/bindings/weather_binding.dart';
import 'features/weather/presentation/pages/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: WeatherBinding(),
      home: WeatherPage(),
    );
  }
}
