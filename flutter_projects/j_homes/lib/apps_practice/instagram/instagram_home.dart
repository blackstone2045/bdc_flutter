import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstagramHome extends StatefulWidget {
  const new({super.key});

  @override
  State<InstagramHome> createState() => _InstagramHomeState();
}

class _InstagramHomeState extends State<InstagramHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Instagram",
          style: GoogleFonts.archivoBlack(fontSize: 24, color: Colors.black),
        ),
        elevation: 0,

        actions: [
          const Image(image: AssetImage("assets/icons/Create.png")),
          const SizedBox(width: 10),
          const Icon(Icons.favorite_outline, color: Colors.black),
          const SizedBox(width: 10),
          const Image(image: AssetImage("assets/icons/Share.png")),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              spacing: 10,
              children: [
                CircleAvatar(child: Image(image: image)),
                CircleAvatar(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
