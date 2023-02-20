import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioNewsPage extends StatefulWidget {
  const DioNewsPage({super.key});

  @override
  State<DioNewsPage> createState() => _DioNewsPageState();
}

class _DioNewsPageState extends State<DioNewsPage> {
  final ScrollController _scrollController = ScrollController();
  final List _list = []; //数据
  int _page = 1; //分页
  bool _flag = true; //解决重复请求的问题
  bool _hasData = true;
  @override
  void initState() {
    super.initState();
    _getData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 30) {
        print("加载更多");
        _getData();
      }
    });
  }

  _getData() async {
    if (_flag && _hasData) {
      _flag = false;
      String apiUri =
          "https://www.phonegap100.com/appapi.php/?a=getPortalList&catid=20&page=$_page";

      print(apiUri);
      var response = await Dio().get(apiUri);
      // print(response.data is String);
      var res = json.decode(response.data)["result"];
      // print(newsData is Map);

      setState(() {
        _list.addAll(res);
        _page++;
        _flag = true;
      });

      //判断有没有数据
      if (res.length < 20) {
        setState(() {
          _hasData = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('下拉上拉加载'),
      ),
      body: _list.isNotEmpty
          ? RefreshIndicator(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  if (index == _list.length - 1) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text("${_list[index]["title"]}", maxLines: 1),
                          onTap: () {
                            Navigator.pushNamed(context, "/newsContent",
                                arguments: {"aid": _list[index]["aid"]});
                          },
                        ),
                        const Divider(),
                        _progressIndicator(),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        ListTile(
                          title: Text("${_list[index]["title"]}", maxLines: 1),
                          onTap: () {
                            Navigator.pushNamed(context, "/newsContent",
                                arguments: {"aid": _list[index]["aid"]});
                          },
                        ),
                        const Divider(),
                      ],
                    );
                  }
                },
              ),
              onRefresh: () async {
                print("下拉刷新");
                _getData();
              })
          : _progressIndicator(),
    );
  }

  //自定义组件
  Widget _progressIndicator() {
    if (_hasData) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return const Text("---我是有底线的---");
    }
  }
}
