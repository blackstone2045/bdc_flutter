import 'package:clean_architecture_demo/features/users/presentation/controllers/user_controller.dart';
import 'package:clean_architecture_demo/features/users/presentation/pages/user_details_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';



class UserPage extends GetView<UserController> {
  const UserPage({super.key});


  // late final GetUsers getUsers;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users Page')),
      body: Obx((){
        return RefreshIndicator(
          onRefresh: controller.fetchUsers,
          child: ListView.builder(

          itemCount: controller.users.length,
          itemBuilder: (_,index){
            final user = controller.users[index];
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
          }),
        );
      }) ,
    );
  }
}

