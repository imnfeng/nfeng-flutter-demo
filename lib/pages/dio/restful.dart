import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class RestfulPage extends StatefulWidget {
  const RestfulPage({super.key});

  @override
  State<RestfulPage> createState() => _RestfulPageState();
}

class _RestfulPageState extends State<RestfulPage> {
  //Restful Api中 get主要用于获取数据
  _getData() async {
    var response = await Dio()
        .get("https://jdmall.itying.com/api/httpGet", queryParameters: {
      "username": "张三",
      "age": 20,
    });
    print(response.data);
    print(response.data is Map);
    print(response.data["msg"]);
  }

  //Restful Api中 post主要用于获取数据
  _postData() async {
    var response =
        await Dio().post("https://jdmall.itying.com/api/httpPost", data: {
      "username": "张三",
      "address": "北京",
    });
    print(response.data);
    print(response.data is Map);
    print(response.data["msg"]);
  }

  //Restful Api中 put主要用于更新数据
  _putData() async {
    var response =
        await Dio().put("https://jdmall.itying.com/api/httpPut", data: {
      "id": "123",
      "username": "张三",
      "address": "北京",
    });
    print(response.data);
    print(response.data is Map);
    print(response.data["msg"]);
  }

  //Restful Api中 delete主要用于删除数据
  _deleteData() async {
    var response = await Dio()
        .delete("https://jdmall.itying.com/api/httpDelete", queryParameters: {
      "id": "123",
      "username": "张三",
      "address": "北京",
    });
    print(response.data);
    print(response.data is Map);
    print(response.data["msg"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _getData,
                child: const Text("Get请求数据"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _postData,
                child: const Text("Post请求数据"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _putData,
                child: const Text("Put请求数据"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _deleteData,
                child: const Text("删除数据"),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
