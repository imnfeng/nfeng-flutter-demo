import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioAndFutureBuilderGetCategory extends StatefulWidget {
  const DioAndFutureBuilderGetCategory({super.key});

  @override
  State<DioAndFutureBuilderGetCategory> createState() =>
      _DioAndFutureBuilderGetCategoryState();
}

class _DioAndFutureBuilderGetCategoryState
    extends State<DioAndFutureBuilderGetCategory> {
  final List _list = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<List> _getData() async {
    var response = await Dio().get("https://jdmall.itying.com/api/pcate");
    print(response.data);
    print(response.data["result"] is List);
    print(response.data["result"][0]["title"]);

    return response.data["result"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
      ),
      body: FutureBuilder(
        future: _getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text("Error:${snapshot.error}"));
            } else {
              var list = snapshot.data as List;
              return ListView(
                children: list.map((value) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text("${value["title"]}"),
                      ),
                      const Divider(),
                    ],
                  );
                }).toList(),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
