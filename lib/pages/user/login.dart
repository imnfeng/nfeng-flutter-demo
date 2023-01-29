import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _usernameController;
  String username = "";
  String password = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usernameController = TextEditingController.fromValue(TextEditingValue(
      text: "zhangsan",
      selection: TextSelection.fromPosition(
        TextPosition(offset: username.length),
      ),
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("登录页面")),
      // body: Center(
      //     child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     const Text("登录跳转演示,执行登录后返回到上一个页面"),
      //     const SizedBox(height: 40),
      //     ElevatedButton(
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //       child: const Text("执行登录"),
      //     )
      //   ],
      // )),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          TextField(
            controller: _usernameController,
            onChanged: (value) {
              setState(() {
                username = value;
              });
            },
            decoration: const InputDecoration(
              icon: Icon(Icons.people),
              hintText: "请输入用户名",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
            decoration: const InputDecoration(
              icon: Icon(Icons.lock),
              hintText: "请输入密码",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: ElevatedButton(
              onPressed: () {
                print("登录");
              },
              child: const Text("登录"),
            ),
          ),
          Text("$username  $password")
        ],
      ),
    );
  }
}
