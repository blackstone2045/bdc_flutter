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
            SizedBox(height: 10),
            /*....Column and Row.....*/
            Container(
              margin: EdgeInsets.all(10),
              color: const Color.fromARGB(255, 64, 255, 175),
              child: Text(
                "This is Column , Row , Padding and Margin",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),

              color: const Color.fromARGB(255, 64, 255, 175),
              child: Column(
                spacing: 10,
                children: [RowDemo(), RowDemo(), RowDemo(), RowDemo()],
              ),
            ),
            /*...............Image.............*/
            Container(
              color: Colors.lightBlueAccent,
              child: Column(
                children: [
                  Text(
                    "This is Images",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Image.network(
                    width: 200,
                    height: 200,
                    "https://static.vecteezy.com/system/resources/thumbnails/058/177/548/small/hot-air-balloon-flying-over-canyonlands-national-park-at-sunset-photo.jpg",
                  ),
                  Text("Network Image"),
                  Image.asset("assets/image_01.jpg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowDemo extends StatelessWidget {
  const RowDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        Container(
          height: 50,
          width: 50,
          color: const Color.fromARGB(255, 226, 255, 64),
          child: Text(""),
        ),
        Container(
          height: 50,
          width: 50,
          color: const Color.fromARGB(255, 226, 255, 64),
          child: Text(""),
        ),
        Container(
          height: 50,
          width: 50,
          color: const Color.fromARGB(255, 226, 255, 64),
          child: Text(""),
        ),
        Container(
          height: 50,
          width: 50,
          color: const Color.fromARGB(255, 226, 255, 64),
          child: Text(""),
        ),
        Container(
          height: 50,
          width: 50,
          color: const Color.fromARGB(255, 226, 255, 64),
          child: Text(""),
        ),
        Container(
          height: 50,
          width: 50,
          color: const Color.fromARGB(255, 226, 255, 64),
          child: Text("", overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
