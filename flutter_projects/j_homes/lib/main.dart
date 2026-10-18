import 'package:flutter/material.dart';

void main() {
  runApp(const JHomesApp());
}

class JHomesApp extends StatelessWidget {
  const JHomesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JHomes - Property Rental Solutions',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFA5C3C6), // Page Background Color
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JHomes - Property Rental Solutions',
      home: Scaffold(
        extendBodyBehindAppBar: true,
        
        body: ListView(
          children: [
            SafeArea(
              child: Container(
                height: 907,
                width: 375,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/couples.jpg'),
                    fit: BoxFit.cover
                  ),
                ),
              ),
            ),

            ],
        ),
      ),
    );
  }
}
