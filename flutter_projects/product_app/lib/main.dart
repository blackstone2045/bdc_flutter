import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/bindings/initial_binding.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

import 'features/auth/presentation/controllers/auth_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Authentication Demo',
      debugShowCheckedModeBanner: false,

      initialBinding: InitialBinding(),

      initialRoute: AppRoutes.login,

      getPages: AppPages.pages,

      home: const AuthGate(),
    );
  }
}

class AuthGate extends GetView<AuthController> {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      if (controller.isAuthenticated.value) {
        return  GetRouterOutlet(
          initialRoute: AppRoutes.home,
        );
      }

      return  GetRouterOutlet(
        initialRoute: AppRoutes.login,
      );
    });
  }
}
