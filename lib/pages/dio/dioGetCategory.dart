import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioGetCategoryPage extends StatefulWidget {
  const DioGetCategoryPage({super.key});

  @override
  State<DioGetCategoryPage> createState() => _DioGetCategoryPageState();
}

class _DioGetCategoryPageState extends State<DioGetCategoryPage> {
  List _list = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() async {
    var response = await Dio().get("https://jdmall.itying.com/api/pcate");
    print(response.data);
    print(response.data["result"] is List);
    print(response.data["result"][0]["title"]);

    setState(() {
      _list = response.data["result"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
      ),
      body: _list.isNotEmpty
          ? ListView(
              children: _list.map((value) {
                return Column(
                  children: [
                    ListTile(
                      title: Text("${value["title"]}"),
                    ),
                    const Divider(),
                  ],
                );
              }).toList(),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
