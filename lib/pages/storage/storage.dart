import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../tools/storage.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({super.key});

  @override
  State<StoragePage> createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  _saveData() async {
    final prefs = await _prefs;
    prefs.setString("username", "张三");
    prefs.setInt("age", 20);

    List<String> userinfo = ["张三", "李四", "王五"];
    prefs.setStringList("userinfo", userinfo);

    List<Map> newsList = [
      {"title": "我是一个标题"},
      {"title": "我是二个标题"},
      {"title": "我是一个标题"},
      {"title": "我是一个标题"},
      {"title": "我是一个标题"},
    ];

    prefs.setString("newsList", json.encode(newsList));
  }

  _getData() async {
    final prefs = await _prefs;
    String? username = prefs.getString("username");
    print(username);

    int? age = prefs.getInt("age");
    print(age);

    List<String>? list = prefs.getStringList("userinfo");
    print(list);
    print(list![0]);

    //获取List<Map>
    String? newsList = prefs.getString("newsList");
    var tempData = json.decode(newsList!);
    print(tempData[0]);
    print(tempData[0]["title"]);
  }

  _removeData() async {
    final prefs = await _prefs;
    prefs.remove("username");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                Storage.setData("username", "李四");
              },
              child: const Text("设置数据"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                var username = await Storage.getData("username");
                // print(username as String);
                print(username is String);
                print(username);
              },
              child: const Text("获取数据"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                List<Map> list = [
                  {"title": "一个新闻111", "author": "itying"},
                  {"title": "一个新闻", "author": "itying"},
                  {"title": "一个新闻", "author": "itying"},
                ];
                Storage.setData("newslist", list);
              },
              child: const Text("设置List"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                var list = Storage.getData("newslist");
                print(list is List);
                print(list[0]);
              },
              child: const Text("获取List数据"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Storage.setData("num", 123.4);
              },
              child: const Text("设置num数据"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                var num = Storage.getData("num");
                print(num is double);
                print(num);
              },
              child: const Text("获取num数据"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Storage.setData("flag", true);
              },
              child: const Text("设置bool数据"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                var flag = Storage.getData("flag");
                print(flag is bool);
                print(flag);
              },
              child: const Text("获取bool数据"),
            ),
            const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: _saveData,
            //   child: const Text('保存数据'),
            // ),
            // const SizedBox(height: 10),
            // ElevatedButton(
            //   onPressed: _getData,
            //   child: const Text('获取数据'),
            // ),
            // const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _removeData,
              child: const Text('清除数据'),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
