import 'package:flutter/material.dart';
import 'package:j_homes/widgets/dropdown_example.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Sample'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.cloud_outlined)),
              Tab(icon: Icon(Icons.beach_access_sharp)),
              Tab(icon: Icon(Icons.brightness_5_sharp)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            DropdownExample(),
            Center(child: Text("It's rainy here")),
            Center(child: Text("It's sunny here")),
          ],
        ),
      ),
    );
  }
}
