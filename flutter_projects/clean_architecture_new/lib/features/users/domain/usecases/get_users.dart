import 'package:clean_architecture_new/features/users/domain/repositories/user_repository.dart';

import '../entities/user.dart';

class GetUsers {
  final UserRepository repository;
  GetUsers(this.repository);

  Future<List<User>> call() {
    return repository.getUsers();
  }
}
