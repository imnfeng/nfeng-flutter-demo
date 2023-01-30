import 'package:flutter/material.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  int sex = 1;
  int flag = 1;

  _onChanged(value) {
    setState(() {
      sex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Radio"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Text("男:"),
              Radio(value: 1, groupValue: sex, onChanged: _onChanged),
              const SizedBox(width: 20),
              const Text("女:"),
              Radio(value: 2, groupValue: sex, onChanged: _onChanged)
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(sex == 1 ? "男" : "女")],
          ),
          const SizedBox(height: 20),
          const Text("是否已进行核酸检测:"),
          Column(
            children: [
              RadioListTile(
                title: const Text("已完成核酸"),
                value: 1,
                groupValue: flag,
                onChanged: ((value) {
                  setState(() {
                    flag = value as int;
                  });
                }),
              ),
              RadioListTile(
                title: const Text("未完成核酸"),
                value: 2,
                groupValue: flag,
                onChanged: ((value) {
                  setState(() {
                    flag = value as int;
                  });
                }),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(flag == 1 ? "已完成" : "未完成")],
          )
        ],
      ),
    );
  }
}
