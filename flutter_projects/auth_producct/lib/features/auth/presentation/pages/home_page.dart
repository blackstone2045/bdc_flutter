import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class HomePage extends GetView<AuthController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: controller.logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),

      body: Obx(() {
        final user = controller.user.value;

        if (user == null) {
          return const Center(
            child: Text('No user information available'),
          );
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome, ${user.name}'),
              const SizedBox(height: 8),
              Text(user.email),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: controller.fetchCurrentUser,
                child: const Text('Refresh Profile'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
