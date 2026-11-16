import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../routes/app_routes.dart';

class VerificationController extends GetxController {
  final otpController = TextEditingController();
  final isLoading = false.obs;
  
  late String email;
  late String fromScreen;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>?;
    email = args?['email'] ?? "your email";
    fromScreen = args?['flow'] ?? "signup";
  }

  Future<void> verify() async {
    if (otpController.text.length < 4) {
      Get.snackbar("Error", "Please enter the full 4-digit code",
          snackPosition: SnackPosition.TOP);
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;

    if (fromScreen == 'reset') {
      Get.toNamed(AppRoute.resetPassword);
    }
    else if(fromScreen == 'signup') {
      Get.toNamed(AppRoute.accountCreateWelcomeMessageScreen);
    }
    else {
      // For signup fromScreen, go to success or home
      Get.toNamed(AppRoute.passwordUpdated, arguments: {'title': 'Account Created'});
    }
  }

  void resendCode() {
    Get.snackbar("Info", "Verification code resent to $email",
        snackPosition: SnackPosition.TOP);
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }
}
