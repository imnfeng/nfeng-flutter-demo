import 'dart:convert';

import 'package:flutter/material.dart';

class JsonMapPage extends StatefulWidget {
  const JsonMapPage({super.key});

  @override
  State<JsonMapPage> createState() => _JsonMapPageState();
}

class _JsonMapPageState extends State<JsonMapPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //1、Map转换成Json字符串
    // Map userInfo = {"username": "张三", "age": 20};

    // print(userInfo["username"]);
    // String str = json.encode(userInfo);

    // print(str);

    //2、Json字符串转换成Map
    String str = '{"username": "张三", "age": 20}';
    Map userInfo = json.decode(str);

    print(userInfo is Map);
    print(userInfo);
    print(userInfo["username"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JsonMap"),
      ),
      body: const Center(
        child: Text("JSON字符串和Map类型的转换"),
      ),
    );
  }
}
