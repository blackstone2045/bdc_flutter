import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  const FadeAnimation({super.key});

  @override
  State<FadeAnimation> createState() => FadeAnimationState();
}

class FadeAnimationState extends State<FadeAnimation> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  bool _first = false;
  double _padding = 0.8;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedOpacity(
            curve: Curves.bounceIn,
            opacity: opacityLevel,
            duration: const Duration(seconds: 3),
            child: const FlutterLogo(size: 50),
          ),
          ElevatedButton(
            onPressed: _changeOpacity,
            child: const Text('Fade Logo'),
          ),

          GestureDetector(
            onTap: () => setState(() => _first = !_first),
            child: AnimatedCrossFade(
              firstCurve: Curves.easeInOutCirc,
              secondCurve: Curves.easeInOutCirc,
              duration: const Duration(milliseconds: 350),
              firstChild: const Icon(
                Icons.done,
                size: 100,
                color: Colors.green,
              ),
              secondChild: const Icon(
                Icons.cancel,
                size: 100,
                color: Colors.red,
              ),
              crossFadeState: _first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ),
          AnimatedPadding(
            duration: Duration(milliseconds: 500),
            padding: EdgeInsets.all(_padding),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _padding = _padding == 8 ? 100 : 8;
                });
              },
              child: Container(height: 100, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
