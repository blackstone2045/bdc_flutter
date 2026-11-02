import 'package:flutter/material.dart';
import 'package:j_homes/widgets/custom_app_bar.dart';
import 'package:j_homes/widgets/custom_drawer.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.lightGreen,
     // appBar: CustomAppBar(title: "Search"),
      body: Center(child: Text("This is SearchPage")),
    );
  }
}
