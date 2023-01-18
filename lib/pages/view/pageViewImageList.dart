import 'package:flutter/material.dart';
import '../../res/listData.dart';

class PageViewImageList extends StatefulWidget {
  const PageViewImageList({super.key});

  @override
  State<PageViewImageList> createState() => _PageViewImageListState();
}

class _PageViewImageListState extends State<PageViewImageList> {
  List<Widget> _getListData() {
    var tempList = listData.map((value) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "/hero", arguments: {
            "imageUrl": value['imageUrl'],
            "initialPage": value['id'],
            "listData": listData
          });
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromRGBO(233, 233, 233, 0.9), width: 1)),
          child: Column(
            children: <Widget>[
              Hero(
                  tag: value['imageUrl'],
                  child: Image.network(value['imageUrl'])),
              const SizedBox(height: 10),
              Text(
                value['title'],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("pageViewImageList"),
      ),
      body: GridView.count(
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        padding: const EdgeInsets.all(10),
        crossAxisCount: 2,
        children: _getListData(),
      ),
    );
  }
}
