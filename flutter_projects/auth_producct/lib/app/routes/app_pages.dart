import 'package:get/get.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/home_page.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
    ),

    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
    ),

    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
    ),
  ];
}
