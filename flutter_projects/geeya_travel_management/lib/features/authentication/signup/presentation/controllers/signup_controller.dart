import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../routes/app_routes.dart';

class SignupController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  
  final selectedLanguage = "English".obs;
  final agreeToTerms = false.obs;
  final obscurePassword = true.obs;
  final isLoading = false.obs;

  final List<String> languages = [
    "Use device language",
    "English",
    "Español",
    "Italiano",
    "Deutsch",
    "中文（简体）"
  ];

  void toggleObscurePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void setLanguage(String? value) {
    if (value != null) selectedLanguage.value = value;
  }

  void toggleTerms(bool? value) {
    agreeToTerms.value = value ?? false;
  }

  Future<void> signup() async {
    if (!agreeToTerms.value) {
      Get.snackbar("Error", "You must agree to the terms",
          snackPosition: SnackPosition.TOP);
      return;
    }
    
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
    
    Get.toNamed(AppRoute.verification);
  }

  void navigateToLogin() {
    Get.toNamed(AppRoute.login);
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
