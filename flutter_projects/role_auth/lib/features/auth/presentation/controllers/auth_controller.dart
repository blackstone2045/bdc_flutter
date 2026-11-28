import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../core/storage/token_storage.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/get_current_user.dart';
import '../../domain/usecases/login_user.dart';
import '../../domain/usecases/logout_user.dart';
import '../../domain/usecases/register_user.dart';

class AuthController extends GetxController {
  final RegisterUser registerUser;
  final LoginUser loginUser;
  final GetCurrentUser getCurrentUser;
  final LogoutUser logoutUser;
  final TokenStorage tokenStorage;

  AuthController({
    required this.registerUser,
    required this.loginUser,
    required this.getCurrentUser,
    required this.logoutUser,
    required this.tokenStorage,
  });

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  final Rxn<User> user = Rxn<User>();

  final isLoading = false.obs;
  final isAuthenticated = false.obs;
  final errorMessage = ''.obs;
  final rememberMe = false.obs;
  final savedEmail = ''.obs;
  final List<String> roles = ['user', 'admin'];
  late final RxString selectedUser = roles.first.obs;
  @override
  void onInit() {
    super.onInit();

    loadSavedCredentials();
    checkAuthentication();
  }

  // Register
  Future<bool> register({
    required String name,
    required String email,
    required String password,
    required String role
  }) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await registerUser(

        name: name,
        email: email,
        password: password,

        role: selectedUser.value ,
        roleKey: selectedUser.value=='admin'?'admin':'',
      );

      user.value = result;
      isAuthenticated.value = true;

      return true;
    } catch (e) {
      errorMessage.value = _getErrorMessage(e);
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // Login
  Future<bool> login({required String email, required String password}) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await loginUser(email: email, password: password);

      user.value = result;
      isAuthenticated.value = true;
      // Remember Email
      if (rememberMe.value) {
        await tokenStorage.saveEmail(email.trim());
      } else {
        await tokenStorage.clearEmail();
      }

      return true;
    } catch (e) {
      errorMessage.value = _getErrorMessage(e);
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  // Get current user
  Future<void> fetchCurrentUser() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await getCurrentUser();

      user.value = result;
      isAuthenticated.value = true;
    } catch (e) {
      user.value = null;
      isAuthenticated.value = false;

      // An invalid or expired token cannot be used.
      await tokenStorage.clearToken();
    } finally {
      isLoading.value = false;
    }
  }

  // Check authentication on app startup
  Future<void> checkAuthentication() async {
    if (!tokenStorage.hasToken) {
      isAuthenticated.value = false;
      user.value = null;
      return;
    }

    await fetchCurrentUser();
  }

  // Logout
  Future<void> logout() async {
    try {
      isLoading.value = true;

      await logoutUser();

      user.value = null;
      isAuthenticated.value = false;

      Get.offAllNamed('/login');
    } catch (e) {
      errorMessage.value = _getErrorMessage(e);
    } finally {
      isLoading.value = false;
    }
  }

  void loadSavedCredentials() {
    savedEmail.value = tokenStorage.getEmail() ?? '';

    rememberMe.value = savedEmail.value.isNotEmpty;
  }

  String _getErrorMessage(Object error) {
    final message = error.toString();

    return message.replaceFirst('Exception: ', '');
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();

    emailFocus.dispose();
    passwordFocus.dispose();

    super.onClose();
  }
}
