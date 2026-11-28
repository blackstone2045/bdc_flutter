import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser(this.repository);

  Future<User> call({
    required String name,
    required String email,
    required String password,
    required String role,
    String? roleKey,
  }) {
    return repository.register(
      name: name,
      email: email,
      password: role,
      role: role,
        roleKey:roleKey??'',
    );
  }
}
