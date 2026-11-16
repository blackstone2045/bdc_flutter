import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final nameController = TextEditingController(text: "Cristina");
  final emailController = TextEditingController(text: "example@gmail.com");

  void saveChanges() {
    Get.back();
    Get.snackbar("Success", "Profile updated successfully");
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
