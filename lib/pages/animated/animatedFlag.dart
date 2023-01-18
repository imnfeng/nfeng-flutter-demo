import 'package:flutter/material.dart';

class AnimatedFlagPage extends StatefulWidget {
  const AnimatedFlagPage({super.key});

  @override
  State<AnimatedFlagPage> createState() => _AnimatedFlagPageState();
}

class _AnimatedFlagPageState extends State<AnimatedFlagPage> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
      ),
      appBar: AppBar(
        title: const Text('Title'),
      ),
      // body: Stack(children: [
      //   ListView(
      //     children: const [
      //       ListTile(
      //         title: Text("我是一个列表"),
      //       )
      //     ],
      //   ),
      //   Positioned(
      //     left: 0,
      //     top: 0,
      //     bottom: 0,
      //     child: AnimatedContainer(
      //       duration: const Duration(seconds: 1, milliseconds: 100),
      //       width: 200,
      //       height: double.infinity,
      //       transform: flag
      //           ? Matrix4.translationValues(-200, 0, 0)
      //           : Matrix4.translationValues(0, 0, 0),
      //       color: Colors.yellow,
      //     ),
      //   )
      // ]),
      // body: AnimatedPadding(
      //   curve: Curves.bounceInOut,
      //   padding: EdgeInsets.fromLTRB(10, flag ? 10 : 400, 0, 0),
      //   duration: const Duration(seconds: 2),
      //   child: Container(
      //     width: 100,
      //     height: 100,
      //     color: Colors.red,
      //   ),
      // ),
      // body: Center(
      //   child: AnimatedOpacity(
      //     opacity: flag ? 0.2 : 1,
      //     duration: const Duration(seconds: 1),
      //     curve: Curves.easeIn,
      //     child: Container(
      //       width: 100,
      //       height: 100,
      //       color: Colors.red,
      //     ),
      //   ),
      // ),
      // body: Stack(
      //   children: [
      //     ListView(
      //       children: const [
      //         ListTile(
      //           title: Text("我是一个列表"),
      //         ),
      //         ListTile(
      //           title: Text("我是一个列表"),
      //         ),
      //         ListTile(
      //           title: Text("我是一个列表"),
      //         ),
      //         ListTile(
      //           title: Text("我是一个列表"),
      //         ),
      //         ListTile(
      //           title: Text("我是一个列表"),
      //         ),
      //         ListTile(
      //           title: Text("我是一个列表"),
      //         ),
      //       ],
      //     ),
      //     AnimatedPositioned(
      //         curve: Curves.linear,
      //         right: flag ? 10 : 300,
      //         top: flag ? 10 : 560,
      //         duration: const Duration(seconds: 1, milliseconds: 500),
      //         child: Container(
      //           width: 60,
      //           height: 60,
      //           color: Colors.blue,
      //         )),
      //   ],
      // ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 400,
          height: 220,
          color: Colors.yellow,
          // child: AnimatedDefaultTextStyle(
          //   duration: const Duration(seconds: 1),
          //   style: TextStyle(fontSize: flag ? 20 : 50, color: Colors.black),
          //   child: const Text("你好Flutter"),
          // ),
          child: AnimatedSwitcher(
            transitionBuilder: ((child, animation) {
              return ScaleTransition(
                scale: animation,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            }),
            duration: const Duration(seconds: 1),
            // child: flag
            //     ? const CircularProgressIndicator()
            //     : Image.network(
            //         "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/z78vVm.jpg",
            //         fit: BoxFit.cover,
            //       ),
            child: Text(
              key: UniqueKey(),
              flag ? "你好Flutter" : "你好N-feng",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
      ),
    );
  }
}
