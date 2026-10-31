import 'package:flutter/material.dart';

import 'package:j_homes/widgets/custom_app_bar.dart';
import 'package:j_homes/widgets/custom_drawer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      drawer: CustomDrawer(),
      appBar: CustomAppBar(title: "Profile"),
      body: Center(child: Text("This is ProfilePage")),
    );
  }
}
