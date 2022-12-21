import 'package:flutter/material.dart';

class WidgetKeyPage extends StatefulWidget {
  const WidgetKeyPage({super.key});

  @override
  State<WidgetKeyPage> createState() => _WidgetKeyPageState();
}

class _WidgetKeyPageState extends State<WidgetKeyPage> {
  List<Widget> list = [];
  final GlobalKey _globalKey1 = GlobalKey();
  final GlobalKey _globalKey2 = GlobalKey();
  final GlobalKey _globalKey3 = GlobalKey();

  @override
  void initState() {
    super.initState();
    list = [
      Box(
        key: _globalKey1,
        color: Colors.red,
      ),
      Box(
        key: _globalKey2,
        color: Colors.yellow,
      ),
      Box(
        key: _globalKey3,
        color: Colors.blue,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).orientation);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // setState(() {
          //   list.shuffle();
          // });
          var boxState = _globalKey1.currentState as _BoxState;
          print(boxState._count);
          setState(() {
            boxState._count++;
          });
          boxState.run();

          var boxWidget = _globalKey1.currentWidget as Box;
          print(boxWidget.color);

          var renderBox =
              _globalKey1.currentContext!.findRenderObject() as RenderBox;
          print(renderBox.size);
        },
        child: const Icon(Icons.refresh),
      ),
      appBar: AppBar(
        title: const Text('Title'),
      ),
      // body: Center(
      //     child: MediaQuery.of(context).orientation == Orientation.portrait
      //         ? Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: list,
      //           )
      //         : Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: list,
      //           )),
      body: Center(
        child: Box(
          key: _globalKey1,
          color: Colors.red,
        ),
      ),
    );
  }
}

class Box extends StatefulWidget {
  final Color color;
  const Box({Key? key, required this.color}) : super(key: key);

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  int _count = 0;
  void run() {
    print("我是box的run方法");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.red,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(widget.color),
          ),
          onPressed: () {
            setState(() {
              _count++;
            });
          },
          child: Text(
            "$_count",
            style: Theme.of(context).textTheme.headline2,
          )),
    );
  }
}
