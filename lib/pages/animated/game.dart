import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final StreamController<int> _inputController = StreamController.broadcast();
  final StreamController<int> _scoreController = StreamController.broadcast();

  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: StreamBuilder(
            stream: _scoreController.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                score += snapshot.data as int;
                return Text("得分：$score");
              }
              if (snapshot.hasError) {
                return Text("Error:${snapshot.error}");
              }
              return const Text("监听中..");
            }),
      ),
      body: Stack(
        children: [
          ...List.generate(3, (index) {
            return Game(
              inputController: _inputController,
              scoreController: _scoreController,
            );
          }),
          KeyPad(
            inputController: _inputController,
          ),
        ],
      ),
    );
  }
}

class Game extends StatefulWidget {
  final StreamController<int> inputController;
  final StreamController<int> scoreController;
  const Game(
      {super.key,
      required this.inputController,
      required this.scoreController});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> with SingleTickerProviderStateMixin {
  late int a, b;
  late double x;
  late AnimationController _animationController;
  late Color color;

  void reset() {
    a = Random().nextInt(5) + 1;
    b = Random().nextInt(5);
    x = Random().nextDouble() * 320;
    color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  @override
  void initState() {
    super.initState();
    reset();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: Random().nextInt(5000) + 5000),
    );
    _animationController.forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        reset();
        widget.scoreController.add(-1);
        _animationController.forward(from: 0.0);
      }
    });

    //监听键盘按键
    widget.inputController.stream.listen((event) {
      print(event);
      if (a + b == event) {
        reset();
        widget.scoreController.add(3);
        _animationController.forward(from: 0.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Positioned(
          top: Tween(begin: -50.0, end: 560.0)
              .animate(_animationController)
              .value,
          left: x,
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(18)),
            child: Text(
              "$a+$b=？",
              style: const TextStyle(fontSize: 24),
            ),
          ),
        );
      },
    );
  }
}

class KeyPad extends StatelessWidget {
  final StreamController<int> inputController;
  const KeyPad({super.key, required this.inputController});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.red,
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          childAspectRatio: 5 / 2,
          children: List.generate(9, (index) {
            return TextButton(
              style: ButtonStyle(
                shape:
                    MaterialStateProperty.all(const RoundedRectangleBorder()),
                backgroundColor:
                    MaterialStateProperty.all(Colors.primaries[index][300]),
                foregroundColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: () {
                inputController.add(index + 1);
              },
              child: Text(
                "${index + 1}",
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          }),
        ),
      ),
    );
  }
}
