import 'package:flutter/material.dart';

class AnimatedControllerPage extends StatefulWidget {
  const AnimatedControllerPage({super.key});

  @override
  State<AnimatedControllerPage> createState() => _AnimatedControllerPageState();
}

class _AnimatedControllerPageState extends State<AnimatedControllerPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool flag = true;
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
          // _controller.repeat(reverse: true);
          flag ? _controller.forward() : _controller.reverse();
          flag = !flag;
        },
      ),
      appBar: AppBar(
        title: const Text("RotationTransition"),
      ),
      body: Center(
        child: Column(
          children: [
            // const SizedBox(height: 40),
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
            // SlideTransition(
            //   position:
            //       Tween(begin: const Offset(0, 0), end: const Offset(0, 2))
            //           .chain(CurveTween(
            //             curve: Curves.bounceInOut,
            //           ))
            //           .chain(CurveTween(curve: const Interval(0.4, 0.6)))
            //           .animate(_controller),
            //   child: Container(
            //     width: 200,
            //     height: 200,
            //     color: Colors.red,
            //   ),
            // ),
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
            ),
            // const SizedBox(height: 40),
            // AnimatedIcon(
            //   icon: AnimatedIcons.close_menu,
            //   progress: _controller,
            //   size: 40,
            // ),
            // const SizedBox(),
            // AnimatedIcon(
            //   icon: AnimatedIcons.home_menu,
            //   progress: _controller,
            //   size: 40,
            // ),
            // const SizedBox(),
            // AnimatedIcon(
            //   icon: AnimatedIcons.ellipsis_search,
            //   progress: _controller,
            //   size: 40,
            // ),
            // const SizedBox(),
            // ScaleTransition(
            //   scale: _controller.drive(Tween(begin: 0.0, end: 1.0)
            //       .chain(CurveTween(curve: const Interval(0.5, 1)))),
            //   child: const Icon(
            //     Icons.close,
            //     size: 40,
            //   ),
            // ),
            // const SizedBox(),
            // ScaleTransition(
            //   scale: _controller.drive(Tween(begin: 1.0, end: 0.0)
            //       .chain(CurveTween(curve: const Interval(0, 0.5)))),
            //   child: const Icon(
            //     Icons.search,
            //     size: 40,
            //   ),
            // ),
            const SizedBox(height: 40),
            SlidingBox(
              controller: _controller,
              color: Colors.blue[100],
              curve: const Interval(0.0, 0.3),
            ),
            SlidingBox(
              controller: _controller,
              color: Colors.blue[300],
              curve: const Interval(0.2, 0.5),
            ),

            SlidingBox(
              controller: _controller,
              color: Colors.blue[500],
              curve: const Interval(0.4, 0.7),
            ),
            SlidingBox(
              controller: _controller,
              color: Colors.blue[700],
              curve: const Interval(0.6, 0.9),
            ),

            SlidingBox(
              controller: _controller,
              color: Colors.blue[900],
              curve: const Interval(0.8, 1.0),
            ),
          ],
        ),
      ),
    );
  }
}

class SlidingBox extends StatelessWidget {
  final AnimationController controller;
  final Color? color;
  final Curve curve;
  const SlidingBox(
      {super.key,
      required this.controller,
      required this.color,
      required this.curve});

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: controller.drive(Tween(
        begin: const Offset(0.0, 0.0),
        end: const Offset(0.5, 0.0),
      ).chain(CurveTween(curve: curve))),
      child: Container(
        width: 120,
        height: 60,
        color: color,
      ),
    );
  }
}
