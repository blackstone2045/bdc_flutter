import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../routes/app_routes.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;

  Future<void> sendResetCode() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 1));
      isLoading.value = false;

      Get.toNamed(AppRoute.verification, arguments: {'email': emailController.text, 'flow': 'reset'});
    }

  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
