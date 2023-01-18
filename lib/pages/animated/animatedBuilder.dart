import 'package:flutter/material.dart';

class AnimatedBuilderPage extends StatefulWidget {
  const AnimatedBuilderPage({super.key});

  @override
  State<AnimatedBuilderPage> createState() => _AnimatedBuilderPageState();
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool flag = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          // setState(() {
          //   flag = !flag;
          // });
          _controller.repeat(reverse: true);
        },
      ),
      appBar: AppBar(
        title: const Text("AnimatedBuilderBuilder"),
      ),
      body: Center(
        // child: TweenAnimationBuilder(
        //   tween: Tween(begin: 60.0, end: flag ? 60.0 : 200.0),
        //   duration: const Duration(seconds: 1),
        //   builder: ((context, value, child) {
        //     print(value);
        //     return Icon(
        //       Icons.star,
        //       size: value,
        //     );
        //   }),
        // ),
        // child: TweenAnimationBuilder(
        //   tween: Tween(begin: 0.5, end: flag ? 0.5 : 1.0),
        //   duration: const Duration(seconds: 1),
        //   builder: ((context, value, child) {
        //     print(value);
        //     return Opacity(
        //       opacity: value,
        //       child: Container(
        //         width: 200,
        //         height: 200,
        //         color: Colors.red,
        //       ),
        //     );
        //   }),
        // ),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            // return Opacity(
            //   // opacity: _controller.value,
            //   opacity: Tween(begin: 0.5, end: 1.0).animate(_controller).value,
            //   child: Container(
            //     width: 200,
            //     height: 200,
            //     color: Colors.red,
            //   ),
            // );
            // Animation x = Tween(begin: -100.0, end: 100.0)
            //     .animate(_controller);
            Animation y = Tween(begin: -200.0, end: 200.0)
                .chain(CurveTween(curve: Curves.bounceInOut))
                .chain(CurveTween(curve: const Interval(0.3, 0.8)))
                .animate(_controller);
            return Container(
              width: 100,
              height: 100,
              // transform: Matrix4.translationValues(x.value, 0, 0),
              transform: Matrix4.translationValues(0, y.value, 0),
              color: Colors.red,
              child: child,
            );
          },
          child: Column(
            children: const [
              Text("你好"),
              Text("Flutter"),
            ],
          ),
        ),
      ),
    );
  }
}
