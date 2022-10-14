import 'package:flutter/material.dart';
import 'package:flutter01/nfengFont.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Flutter ICON")),
        body: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 120,
      child: ListView(
        // scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          // Container(
          //   width: 120,
          //   decoration: const BoxDecoration(color: Colors.red),
          //   child: Column(children: [
          //     SizedBox(
          //       width: 80,
          //       child: Image.network(
          //         "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/z78vVm.jpg",
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //     const Text('文字')
          //   ]),
          // ),

          ListTile(
            leading: Image.network(
              "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/z78vVm.jpg",
            ),
            title: const Text("新闻标题"),
            subtitle: const Text("新闻内容"),
          ),
          const Divider(),
          ListTile(
            leading: Image.network(
              "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/z78vVm.jpg",
            ),
            title: const Text("新闻标题"),
            subtitle: const Text("新闻内容"),
          ),
          const Divider(),
          ListTile(
            trailing: Image.network(
              "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/z78vVm.jpg",
            ),
            title: const Text("新闻标题"),
            subtitle: const Text("新闻内容"),
          ),
          const Divider(),
          ListTile(
            trailing: Image.network(
              "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/z78vVm.jpg",
            ),
            title: const Text("新闻标题"),
            subtitle: const Text("新闻内容"),
          ),
          const Divider(),
          Image.network(
              "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/z78vVm.jpg"),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
            height: 44,
            child: const Text(
              "我是一个标题",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22),
            ),
          ),
          Image.network(
              "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/z78vVm.jpg"),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
            height: 44,
            child: const Text(
              "我是一个标题",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22),
            ),
          ),
          Image.network(
              "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/z78vVm.jpg"),
          const Divider(),
          const ListTile(
            leading: Icon(
              NfengIcon.weixin,
              color: Colors.green,
            ),
            title: Text("微信登录"),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.assessment),
            title: Text("全部订单"),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(
              Icons.payment,
              color: Colors.green,
            ),
            title: Text("待付款"),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(
              Icons.favorite,
              color: Colors.lightGreen,
            ),
            title: Text("我的收藏"),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(
              Icons.people,
              color: Colors.black54,
            ),
            title: Text("在线客服"),
            trailing: Icon(Icons.chevron_right_sharp),
          ),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 200,
      height: 40,
      margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        "按钮",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      decoration: const BoxDecoration(color: Colors.yellow),
      child: const Text(
        "你好我是Flutter 你好我是Flutter 你好我是Flutter",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900,
          color: Colors.red,
          fontStyle: FontStyle.italic,
          letterSpacing: 2,
          decoration: TextDecoration.underline,
          decorationColor: Colors.black,
          decorationStyle: TextDecorationStyle.dashed,
        ),
      ),
    );
  }
}

class Circular extends StatelessWidget {
  const Circular({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(75),
          image: const DecorationImage(
            image: NetworkImage(
                "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/z78vVm.jpg"),
            fit: BoxFit.cover,
          )),
    );
  }
}

class ClipImage extends StatelessWidget {
  const ClipImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/z78vVm.jpg",
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}

class LocalImage extends StatelessWidget {
  const LocalImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: const BoxDecoration(
        color: Colors.yellow,
      ),
      child: Image.asset(
        "images/pascal-debrunner-DXcIb5pmMEg.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}
