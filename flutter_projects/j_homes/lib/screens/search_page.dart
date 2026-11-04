import 'package:flutter/material.dart';
import 'package:j_homes/widgets/custom_drawer.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? selectedCountry;
  List countries = [
    'Bangladesh',
    'India',
    'Pakistan',
    'Sri Lanka',
    'Nepal',
  ];
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
