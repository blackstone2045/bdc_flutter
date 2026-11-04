import 'package:flutter/material.dart';

class ExpandCard extends StatefulWidget {
  const ExpandCard({super.key});

  @override
  State<ExpandCard> createState() => _ExpandCardState();
}

class _ExpandCardState extends State<ExpandCard> {
  bool expanded = false;
  bool isCircle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onDoubleTap: () {
            setState(() {
              isCircle = !isCircle;
              expanded = !expanded;
            });
          },
          onTap: () => setState(() => expanded = !expanded),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOutCubic,
            width: isCircle ? 110 : double.infinity,
            height: expanded ? 220 : 110,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: expanded ? Colors.deepPurple : Colors.indigo,
              borderRadius: BorderRadius.circular(isCircle ? 55 : 22),
              //shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            ),
            child: Center(
              child: Column(
                children: [
                  // Text(
                  //   expanded ? 'Tap to Srink' : 'Tap to Expand',

                  //   style: TextStyle(color: Colors.white),
                  // ),
                  // Text(
                  //   isCircle
                  //       ? 'Double Tap to Rechtengle'
                  //       : 'Double Tap to Circle',

                  //   style: TextStyle(color: Colors.white),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
