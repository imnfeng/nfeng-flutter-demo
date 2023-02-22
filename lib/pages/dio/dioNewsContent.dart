import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_html/flutter_html.dart';

// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class NewsContentPage extends StatefulWidget {
  final Map arguments;
  const NewsContentPage({super.key, required this.arguments});

  @override
  State<NewsContentPage> createState() => _NewsContentPageState();
}

class _NewsContentPageState extends State<NewsContentPage> {
  List _list = [];
  final bool _hasLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.arguments["aid"]);
    _getData();
  }

  _getData() async {
    String apiUri =
        "https://www.phonegap100.com/appapi.php?a=getPortalArticle&aid=${widget.arguments["aid"]}";
    var response = await Dio().get(apiUri);
    var res = json.decode(response.data);
    // print(res);

    setState(() {
      _list = json.decode(response.data)["result"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("新闻详情"),
      ),
      body: _list.isNotEmpty
          ? ListView(
              children: [
                Text(
                  "${_list[0]["title"]}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 26,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Html(
                    data: _list[0]["content"],
                    style: {
                      "body": Style(
                        backgroundColor: Colors.white,
                      ),
                      "p": Style(
                        fontSize: FontSize.large,
                      ),
                    },
                    onImageTap: (url, context, attributes, element) {
                      print(url);
                    },
                    onLinkTap: (url, context, attributes, element) {
                      print(url);
                      // webView
                    },
                  ),
                )
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      // body: Column(
      //   children: [
      //     !_hasLoading ? const LinearProgressIndicator() : const Text(""),
      //     Expanded(
      //       child: InAppWebView(
      //         initialUrlRequest: URLRequest(
      //           url: Uri.parse(
      //               "https://www.phonegap100.com/appapi.php?a=getPortalArticle&aid=${widget.arguments["aid"]}"),
      //         ),
      //         onProgressChanged: (controller, progress) {
      //           print(progress / 100);
      //           if (progress / 100 > 0.999) {
      //             setState(() {
      //               _hasLoading = true;
      //             });
      //           }
      //         },
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
