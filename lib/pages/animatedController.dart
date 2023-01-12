import 'package:flutter/material.dart';

class AnimatedControllerPage extends StatefulWidget {
  const AnimatedControllerPage({super.key});

  @override
  State<AnimatedControllerPage> createState() => _AnimatedControllerPageState();
}

class _AnimatedControllerPageState extends State<AnimatedControllerPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      // lowerBound: 0.5,
      // upperBound: 1.5,
    );
    _controller.addListener(() {
      print(_controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          _controller.repeat(reverse: true);
        },
      ),
      appBar: AppBar(
        title: const Text("RotationTransition"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // RotationTransition(
            //   turns: _controller,
            //   child: const FlutterLogo(
            //     size: 60,
            //   ),
            // ),
            // FadeTransition(
            //   opacity: _controller,
            //   child: const FlutterLogo(
            //     size: 120,
            //   ),
            // ),
            // ScaleTransition(
            //   scale: _controller.drive(Tween(begin: 0.5, end: 1.2)),
            //   child: Container(
            //     width: 200,
            //     height: 200,
            //     color: Colors.red,
            //   ),
            // ),
            SlideTransition(
              position:
                  Tween(begin: const Offset(0, 0), end: const Offset(0, 2))
                      .chain(CurveTween(
                        curve: Curves.bounceInOut,
                      ))
                      .chain(CurveTween(curve: const Interval(0.4, 0.6)))
                      .animate(_controller),
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _controller.forward();
                  },
                  child: const Text("forward"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _controller.reverse();
                  },
                  child: const Text("Reverse"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _controller.stop();
                  },
                  child: const Text("Stop"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _controller.reset();
                  },
                  child: const Text("rest"),
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     _controller.repeat();
                //   },
                //   child: const Text("repeat"),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
