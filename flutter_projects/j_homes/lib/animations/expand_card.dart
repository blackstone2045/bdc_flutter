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
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          onDoubleTap: () {
            setState(() {
              isCircle = !isCircle;
            });
          },
          onTap: () {
            setState(() {
              expanded = !expanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOutCubic,

            width: 150,
            height: 150,
            padding: const EdgeInsets.all(16),
            // Matrix4.scale diye expand & shrink control
            transform: Matrix4.identity()
              ..scale(expanded ? 2.3 : 2.0, expanded ? 2.3 : 2.0, 1),
            transformAlignment: Alignment.center,
            decoration: BoxDecoration(
              color: expanded ? Colors.deepPurple : Colors.indigo,
              borderRadius: BorderRadius.circular(isCircle ? 100 : 22),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    expanded ? 'Tap to Shrink' : 'Tap to Expand',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    isCircle ? 'Double Tap: Rectangle' : 'Double Tap: Circle',
                    style: const TextStyle(color: Colors.white70, fontSize: 11),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
