import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedListPage extends StatefulWidget {
  const AnimatedListPage({super.key});

  @override
  State<AnimatedListPage> createState() => _AnimatedListPageState();
}

class _AnimatedListPageState extends State<AnimatedListPage> {
  final _globalKey = GlobalKey<AnimatedListState>();
  bool flag = true;
  List<String> list = ["第一条", "第二条"];

  Widget _buildItem(index) {
    return ListTile(
      title: Text(list[index]),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          _deleteItem(index);
        },
      ),
    );
  }

  _deleteItem(index) {
    if (flag == true) {
      flag = false;
      _globalKey.currentState!.removeItem(index, (context, animation) {
        var removeItem = _buildItem(index);
        list.removeAt(index);
        // return FadeTransition(
        //   opacity: animation,
        //   child: removeItem,
        // );
        return ScaleTransition(
          scale: animation,
          child: removeItem,
        );
      });
      Timer.periodic(Duration(milliseconds: 500), (timer) {
        flag = true;
        timer.cancel();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          list.add("我是新增的数据");
          _globalKey.currentState!.insertItem(list.length - 1);
        },
      ),
      body: AnimatedList(
        key: _globalKey,
        initialItemCount: list.length,
        itemBuilder: ((context, index, animation) {
          return FadeTransition(
            opacity: animation,
            child: _buildItem(index),
          );
          // return ScaleTransition(
          //   scale: animation,
          //   child: _buildItem(index),
          // );
        }),
      ),
    );
  }
}
