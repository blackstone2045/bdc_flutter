import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';

class UserDetailsPage extends StatelessWidget {
  User user;
  UserDetailsPage({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Details')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(leading: const Icon(Icons.person), title: Text(user.name)),
            ListTile(leading: const Icon(Icons.email), title: Text(user.email)),
            ListTile(leading: const Icon(Icons.phone), title: Text(user.phone)),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: Text(user.address.city),
            ),
            ListTile(
              leading: const Icon(Icons.work),
              title: Text(user.company.name),
            ),
            ListTile(leading: const Icon(Icons.web), title: Text(user.website)),
            ListTile(leading: const Icon(Icons.phone), title: Text(user.phone)),
          ],
        ),
      ),
    );
  }
}
