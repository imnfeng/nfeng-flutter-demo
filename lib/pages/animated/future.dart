import 'package:flutter/material.dart';

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  int _counter = 0;

  Future<int> getNum() {
    return Future.value(123);
  }

  Future<String> loadData() async {
    await Future.delayed(const Duration(seconds: 3));
    return "你好我是远程数据";
  }

  void _incrementCounter() async {
    int result;
    try {
      result = await getNum();
      print(result);
    } catch (e) {
      print(e);
    }

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _incrementCounter();
        },
      ),
      appBar: AppBar(
        title: const Text("Future"),
      ),
      body: Center(
        child: FutureBuilder(
          future: loadData(),
          initialData: "我是初始化的数据",
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("error: ${snapshot.error}");
            } else {
              return Text("Data:${snapshot.data}");
            }
          },
        ),
      ),
    );
  }
}
