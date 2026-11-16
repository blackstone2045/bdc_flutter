import 'package:clean_architecture_demo/features/todos/presentation/pages/todo_page.dart';
import 'package:clean_architecture_demo/features/users/presentation/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'features/posts/presentation/pages/post_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clean Architecture Demo',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const UserPage(),
    );
  }
}