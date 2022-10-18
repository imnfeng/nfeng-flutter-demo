import 'package:flutter/material.dart';
import './res/listData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // primarySwatch: Colors.yellow,
          ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Flutter ICON")),
        body: const LayoutDemo(),
      ),
    );
  }
}

class Button extends StatelessWidget {
  String text;
  void Function()? onPressed;
  Button(this.text, {Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color.fromARGB(242, 255, 244, 244),
        ),
        foregroundColor: MaterialStateProperty.all(Colors.black45),
      ),
      onPressed: () {},
      child: Text(text),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Row(
          children: [
            Text(
              "热搜",
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
        const Divider(),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            Button("女装", onPressed: () {}),
            Button("笔记本", onPressed: () {}),
            Button("玩具", onPressed: () {}),
            Button("文学", onPressed: () {}),
            Button("女装", onPressed: () {}),
            Button("时尚", onPressed: () {}),
            Button("男装", onPressed: () {}),
            Button("xxxx", onPressed: () {}),
            Button("手机", onPressed: () {}),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Text(
              "历史记录",
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
        const Divider(),
        Column(
          children: const [
            ListTile(title: Text("女装")),
            Divider(),
            ListTile(title: Text("手机")),
            Divider(),
            ListTile(title: Text("电脑")),
            Divider(),
          ],
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.all(40),
          child: OutlinedButton.icon(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black45),
            ),
            onPressed: () {},
            icon: const Icon(Icons.delete),
            label: const Text("清空历史记录"),
          ),
        ),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.only(top: 50),
          children: const [
            ListTile(title: Text("我是一个列表1")),
            ListTile(title: Text("我是一个列表2")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
            ListTile(title: Text("我是一个列表")),
          ],
        ),
        Positioned(
          left: 0,
          top: 0,
          width: size.width,
          height: 44,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 44,
                  color: Colors.black,
                  child: const Text(
                    "二级导航",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        // Container(
        //   height: 400,
        //   width: 300,
        //   color: Colors.red,
        //   child: Stack(
        //     children: [
        //       Positioned(
        //         left: 10,
        //         bottom: 10,
        //         child: Container(
        //           height: 100,
        //           width: 100,
        //           color: Colors.yellow,
        //         ),
        //       ),
        //       const Positioned(
        //         right: 0,
        //         top: 190,
        //         child: Text("你好Flutter"),
        //       )
        //     ],
        //   ),
        // ),
        // Row(
        //   children: [
        //     Expanded(
        //       flex: 2,
        //       child: SizedBox(
        //         height: 180,
        //         child: Image.network(
        //           "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/z78vVm.jpg",
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //     ),
        //     Expanded(
        //       flex: 1,
        //       child: SizedBox(
        //         height: 180,
        //         child: Column(
        //           children: [
        //             Expanded(
        //               flex: 1,
        //               child: SizedBox(
        //                 width: double.infinity,
        //                 child: Image.network(
        //                   "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/z78vVm.jpg",
        //                   fit: BoxFit.cover,
        //                 ),
        //               ),
        //             ),
        //             const SizedBox(
        //               height: 5,
        //             ),
        //             Expanded(
        //               flex: 2,
        //               child: SizedBox(
        //                 width: double.infinity,
        //                 child: Image.network(
        //                   "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/z78vVm.jpg",
        //                   fit: BoxFit.cover,
        //                 ),
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //     )
        //   ],
        // )
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Widget _initGridViewData(context, index) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26,
        ),
      ),
      child: Column(
        children: [
          Image.network(listData[index]["imageUrl"]),
          const SizedBox(height: 10),
          Text(
            listData[index]["title"],
            style: const TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // return GridView.count(
    //   padding: const EdgeInsets.all(10),
    //   crossAxisSpacing: 10,
    //   mainAxisSpacing: 10,
    //   crossAxisCount: 2,
    //   childAspectRatio: 1,
    //   children: _initGridViewData(),
    // );

    // return GridView.builder(
    //   padding: const EdgeInsets.all(10),
    //   itemCount: listData.length,
    //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisSpacing: 10,
    //     mainAxisSpacing: 10,
    //     crossAxisCount: 2,
    //     childAspectRatio: 1,
    //   ),
    //   itemBuilder: _initGridViewData,
    // );

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: IconContainer(
            Icons.home,
          ),
        ),
        IconContainer(
          Icons.ac_unit_sharp,
          color: Colors.orange,
        ),
      ],
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 100,
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

class IconContainer extends StatelessWidget {
  Color color;
  IconData icon;
  IconContainer(this.icon, {super.key, this.color = Colors.red});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 80,
      width: 80,
      color: color,
      child: Icon(
        icon,
        color: Colors.white,
        size: 28,
      ),
    );
  }
}
