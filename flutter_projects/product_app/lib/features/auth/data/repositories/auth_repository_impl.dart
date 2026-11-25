import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

import '../../../../core/storage/token_storage.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final TokenStorage tokenStorage;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.tokenStorage,
  });

  @override
  Future<User> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await remoteDataSource.register(
      name: name,
      email: email,
      password: password,
    );

    await tokenStorage.saveToken(response.accessToken);

    return response.user;
  }

  @override
  Future<User> login({
    required String email,
    required String password,
  }) async {
    final response = await remoteDataSource.login(
      email: email,
      password: password,
    );

    await tokenStorage.saveToken(response.accessToken);

    return response.user;
  }

  @override
  Future<User> getCurrentUser() {
    return remoteDataSource.getCurrentUser();
  }

  @override
  Future<void> logout() async {
    await tokenStorage.clearToken();
  }
}
