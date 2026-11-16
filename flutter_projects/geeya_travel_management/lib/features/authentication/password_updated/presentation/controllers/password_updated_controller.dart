import 'package:get/get.dart';
import '../../../../../routes/app_routes.dart';

class PasswordUpdatedController extends GetxController {
  late String title;
  
  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>?;
    title = args?['title'] ?? "Password updated";
  }

  void backToLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
