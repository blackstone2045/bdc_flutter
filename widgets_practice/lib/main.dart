import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [
            /*....  Stack and Positioned ........*/
            Container(
              color: Colors.lightBlueAccent,
              child: Text(
                "This is Stack and Positiond",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 400,
              width: 400,
              color: Colors.lightBlueAccent,
              child: Stack(
                children: [
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      height: 200,
                      width: 200,
                      color: const Color.fromARGB(255, 255, 64, 207),
                      child: Text("Top left "),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      height: 200,
                      width: 200,
                      color: const Color.fromARGB(255, 64, 255, 175),
                      child: Text("Top right "),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Container(
                      height: 200,
                      width: 200,
                      color: const Color.fromARGB(255, 226, 255, 64),
                      child: Text("bottom left "),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
