import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/routes/app_routes.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: controller.passwordController,
              obscureText: true,
              autofillHints: const [AutofillHints.password],
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),
            Obx(
              () => CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Remember Me'),

                value: controller.rememberMe.value,

                onChanged: (value) {
                  controller.rememberMe.value = value ?? false;
                },
              ),
            ),

            const SizedBox(height: 16),

            Obx(() {
              return ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : () async {
                        final success = await controller.login(
                          email: controller.emailController.text.trim(),
                          password: controller.passwordController.text,
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
