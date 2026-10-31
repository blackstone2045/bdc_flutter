import 'package:flutter/material.dart';
import 'package:j_homes/widgets/custom_app_bar.dart';
import 'package:j_homes/widgets/custom_drawer.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.purple,
      appBar: CustomAppBar(title: "Fovorites"),
      body: Center(child: Text("This is FavoritesPage")),
    );
  }
}
