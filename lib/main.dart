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
        primarySwatch: Colors.yellow,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Flutter ICON")),
        body: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.black,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 180,
                child: Image.network(
                  "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/z78vVm.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                height: 180,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.network(
                          "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/z78vVm.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.network(
                          "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/z78vVm.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
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
