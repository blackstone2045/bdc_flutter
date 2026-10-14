import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 139, 211, 16),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 200,

              padding: EdgeInsets.symmetric(horizontal: 20),

              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 15,
                    color: Colors.black,
                    spreadRadius: 20,
                    blurStyle: BlurStyle.inner,
                  ),
                ],
              ),
              child: Text("01", style: TextStyle(fontSize: 25)),
            ),
            SizedBox(height: 10),
            Container(
              height: 200,
              width: 200,
              padding: EdgeInsets.symmetric(horizontal: 30),

              decoration: BoxDecoration(
                color: Colors.amber,
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(blurRadius: 15, color: Colors.black),
                ],
              ),
              child: Text("02", style: TextStyle(fontSize: 25)),
            ),
            SizedBox(height: 20),
            Container(
              height: 200,
              width: 200,
              padding: EdgeInsets.symmetric(horizontal: 40),

              color: const Color.fromARGB(255, 33, 243, 51),
              child: Text("02", style: TextStyle(fontSize: 25)),
            ),
          ],
        ),
      ),
    );
  }
}
