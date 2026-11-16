import 'package:clean_architecture_new/features/users/domain/entities/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
}
