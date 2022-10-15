import 'package:flutter/material.dart';
import 'package:flutter01/res/listData.dart';

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
    return ListView.builder(
      itemCount: listData.length,
      itemBuilder: (context, i) {
        print(listData[i]);
        return ListTile(
          leading: Image.network(listData[i]["imageUrl"]),
          title: Text(listData[i]["title"]),
          subtitle: Text(listData[i]["author"]),
        );
      },
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
