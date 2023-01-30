import 'package:flutter/material.dart';

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  int _counter = 0;
  Future<String> getStringNum() {
    // return Future.value("你好Future");

    // return Future.delayed(const Duration(seconds: 3), () {
    //   return "你好Future";
    // });

    // return Future(() {
    //   return "你好flutter";
    // });

    return Future(() {
      return Future.error(Exception("this is error"));
    });
  }

  Future<int> getNum() {
    // print("getNum执行");
    // return Future.delayed(const Duration(seconds: 2), () {
    //   return 123;
    // });

    // return Future.error(Exception("this is error"));
    return Future.value(123);
  }

  void _incrementCounter() async {
    // var result = await getNum();
    var result;
    try {
      result = await getNum();
      print(result);
    } catch (e) {
      print(e);
    }
    // print(result);

    // print("执行");
    // getNum().then((value) {
    //   return value * 2;
    // }).then((value) {
    //   print(value);
    // }).catchError((err) {
    //   print(err);
    // }).whenComplete(() {
    //   print("完成");
    // });
    // getStringNum().then((value) {
    //   print(value);
    // }).catchError((err) {
    //   print(err);
    // }).whenComplete(() {
    //   print("完成");
    // });
    // print("---执行--");

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
      body: const Text("body"),
    );
  }
}
