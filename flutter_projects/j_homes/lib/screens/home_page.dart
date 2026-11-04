import 'package:flutter/material.dart';
import 'package:j_homes/widgets/custom_app_bar.dart';
import 'package:j_homes/widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int sliderValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.primaries[sliderValue % 8],
      // appBar: CustomAppBar(title: "Home"),
      body: Scaffold(
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Slider(
                  max: 100,
                  value: sliderValue.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value.toInt();
                    });
                  },
                  activeColor: Colors.primaries[sliderValue % 8],
                ),
              ),
              Text("$sliderValue"),
            ],
          ),
        ),
      ),
    );
  }
}
