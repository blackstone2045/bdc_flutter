import 'package:clean_architecture_demo/features/users/domain/entities/user.dart';
import 'package:clean_architecture_demo/features/users/domain/usecases/get_users.dart';
import 'package:get/get.dart';

import '../../../posts/domain/usecases/get_posts.dart';



class UserController extends GetxController {
  final GetUsers getUsers;

  UserController(this.getUsers);

  // Reactive variables

  final RxList<User> users = <User>[].obs;

  final RxBool isLoading = false.obs;

  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();

    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await getUsers();

      users.assignAll(result);

    } catch (e) {
      errorMessage.value = e.toString();

    } finally {
      isLoading.value = false;
    }
  }
}

