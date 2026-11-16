import 'package:clean_architecture_demo/features/todos/presentation/pages/todo_page.dart';
import 'package:clean_architecture_demo/features/users/presentation/bindings/user_binding.dart';
import 'package:clean_architecture_demo/features/users/presentation/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clean Architecture Demo',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      initialBinding: UserBinding(),
      home: const UserPage(),
    );
  }
}