import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../routes/app_routes.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  final obscurePassword = true.obs;
  final isLoading = false.obs;

  void toggleObscurePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.offAllNamed(AppRoute.navBar);
      return;
    }

    isLoading.value = true;
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;

    // For now, navigate to Discover (which I'll implement later) or Home
    // For testing auth flow, let's just go to a placeholder or back to splash
    Get.snackbar("Success", "Logged in successfully",
        snackPosition: SnackPosition.TOP);
  }

  void navigateToSignup() {
    Get.toNamed(AppRoute.signup);
  }

  void navigateToForgotPassword() {
    Get.toNamed(AppRoute.forgotPassword);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
