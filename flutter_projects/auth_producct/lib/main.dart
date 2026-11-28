import 'package:auth_producct/features/auth/presentation/pages/otp_page.dart';
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

      initialRoute: AppRoutes.otp,
      getPages: AppPages.pages,
      home: const OTPGate(),
    );
  }
}

class AuthGate extends GetView<AuthController> {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }

      if (controller.isAuthenticated.value) {
        return GetRouterOutlet(initialRoute: AppRoutes.home);
      }

      return GetRouterOutlet(initialRoute: AppRoutes.login);
    });
  }
}

class OTPGate extends StatelessWidget {
  const OTPGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Pinput Example'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(30, 60, 87, 1),
        ),
      ),
      body: const FractionallySizedBox(
        widthFactor: 1,
        // You can also checkout the [PinputBuilderExample]
        child: OtpPage(),
      ),
    );
  }
}
