import 'package:get/get.dart';
import '../../../../../core/utils/constants/image_path.dart';
import '../../../../../core/utils/constants/logo_path.dart';
import '../../../../../routes/app_routes.dart';

class SplashController extends GetxController {
  final String appLogo = LogoPath.appLogo;
  final String welcomeBgImage = ImagePath.welcomeBgImage;

  void navigateToLogin() {
    Get.toNamed(AppRoute.login);
  }

  void navigateToSignup() {
    Get.toNamed(AppRoute.signup);
  }
}
