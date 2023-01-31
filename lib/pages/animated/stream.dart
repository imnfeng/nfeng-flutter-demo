import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  final _controller = StreamController.broadcast();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.stream.listen((event) {
      print(event);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.close();
  }

  @override
  Stream<int> loadStreamData() {
    return Stream.periodic(const Duration(seconds: 1), (v) {
      if (Random().nextBool()) {
        return v;
      }
      throw "this is error";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream"),
      ),
      body: Center(
        // child: StreamBuilder(
        //   stream: loadStreamData(),
        //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        //     switch (snapshot.connectionState) {
        //       case ConnectionState.none:
        //         return const Text("没有数据流");

        //       case ConnectionState.waiting:
        //         return const Text("加载中");
        //       case ConnectionState.active:
        //         if (snapshot.hasError) {
        //           return Text("error:${snapshot.error}");
        //         } else {
        //           return Text(
        //             "${snapshot.data}",
        //             style: Theme.of(context).textTheme.headline1,
        //           );
        //         }

        //       case ConnectionState.done:
        //         return const Text("已完成done");

        //       default:
        //         throw "ConnectionState没有别的状态";
        //     }
        //   },
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: _controller.stream
                  .where((value) => value > 2)
                  .map((value) => value * 2),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return const Text("流已关闭");
                }
                if (snapshot.hasError) {
                  return Text("Error:${snapshot.error}");
                }
                if (snapshot.hasData) {
                  return Text(
                    "数据:${snapshot.data}",
                    style: Theme.of(context).textTheme.headline3,
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(height: 40),
            const Divider(),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                _controller.add(1);
              },
              child: const Text("event-1"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _controller.add(2);
              },
              child: const Text("event-2"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _controller.add(3);
              },
              child: const Text("event-3"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _controller.add(4);
              },
              child: const Text("event-4"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _controller.addError("this is err data");
              },
              child: const Text("addError"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _controller.close();
              },
              child: const Text("close"),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
