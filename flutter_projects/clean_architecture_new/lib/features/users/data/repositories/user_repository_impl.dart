import 'package:clean_architecture_new/features/users/domain/entities/user.dart';
import 'package:clean_architecture_new/features/users/domain/repositories/user_repository.dart';

import '../datasourses/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDtaSource;

  UserRepositoryImpl(this.remoteDtaSource);
  @override
  Future<List<User>> getUsers() async {
    return await remoteDtaSource.getUsers();
  }
}
