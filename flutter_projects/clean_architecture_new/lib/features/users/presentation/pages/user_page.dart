import 'package:clean_architecture_new/core/network/dio_client.dart';
import 'package:clean_architecture_new/features/users/domain/entities/user.dart';
import 'package:clean_architecture_new/features/users/presentation/pages/user_details_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/datasourses/user_remote_data_source.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/usecases/get_users.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late final GetUsers getUsers;
  List<User> users = [];
  bool isLoading = false;
  String? errorMessage;
  @override
  void initState() {
    super.initState();
    final Dio dio = DioClient().dio;
    final remoteDataSourse = UserRemoteDataSource(dio);
    final repository = UserRepositoryImpl(remoteDataSourse);
    getUsers = GetUsers(repository);
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    try {
      final result = await getUsers();
      if (!mounted) return;
      setState(() {
        users = result;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = e.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users Page')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailsPage(user: user),
                ),
              );
            },
            title: Text(user.name),
            subtitle: Text(user.email),
          );
        },
      ),
    );
  }
}
