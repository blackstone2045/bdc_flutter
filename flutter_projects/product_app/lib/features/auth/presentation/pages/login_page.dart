import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../../../../app/routes/app_routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            Obx(() {
              return ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : () async {
                  final success = await controller.login(
                    email: emailController.text.trim(),
                    password: passwordController.text,
                  );

                  if (success) {
                    Get.offAllNamed(AppRoutes.home);
                  }
                },
                child: controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : const Text('Login'),
              );
            }),

            Obx(() {
              if (controller.errorMessage.value.isEmpty) {
                return const SizedBox.shrink();
              }

              return Text(
                controller.errorMessage.value,
                style: const TextStyle(color: Colors.red),
              );
            }),

            TextButton(
              onPressed: () {
                Get.toNamed(AppRoutes.register);
              },
              child: const Text('Create an account'),
            ),
          ],
        ),
      ),
    );
  }
}
