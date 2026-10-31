import 'package:flutter/material.dart';
import 'package:j_homes/widgets/custom_app_bar.dart';
import 'package:j_homes/widgets/custom_drawer.dart';

class SettingsPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: CustomDrawer(),
      appBar: CustomAppBar(title: "Settings"),
      body: Center(child: Text("This is Settings")),
    );
  }
}
