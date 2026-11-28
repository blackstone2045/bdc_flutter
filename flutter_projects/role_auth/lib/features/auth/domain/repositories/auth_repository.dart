import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> register({
    required String name,
    required String email,
    required String password,
    required String role,
    String roleKey,
  });

  Future<User> login({required String email, required String password});

  Future<User> getCurrentUser();

  Future<void> logout();
}
