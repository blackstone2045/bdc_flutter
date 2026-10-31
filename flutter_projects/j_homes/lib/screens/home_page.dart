import 'package:flutter/material.dart';
import 'package:j_homes/widgets/custom_app_bar.dart';
import 'package:j_homes/widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.red,
      appBar: CustomAppBar(title: "Home"),
      body: Center(child: Text("This is HomePage")),
    );
  }
}
