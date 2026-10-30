import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
           ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
          ),
           ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
        ],
      ),
    );
  }
}