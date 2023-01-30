import 'package:flutter/material.dart';

class CheckboxPage extends StatefulWidget {
  const CheckboxPage({super.key});

  @override
  State<CheckboxPage> createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {
  bool flag = true;
  final List _hobby = [
    {"checked": true, "title": "吃饭"},
    {"checked": false, "title": "睡觉"},
    {"checked": true, "title": "写代码"},
  ];
  List<Widget> _initHobby() {
    List<Widget> tempList = [];
    for (var i = 0; i < _hobby.length; i++) {
      tempList.add(Row(
        children: [
          Text("${_hobby[i]["title"]}"),
          Checkbox(
              value: _hobby[i]["checked"],
              onChanged: (value) {
                setState(() {
                  _hobby[i]["checked"] = value;
                });
              })
        ],
      ));
    }
    return tempList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Checkbox(
            value: flag,
            onChanged: (value) {
              setState(() {
                flag = value!;
              });
            },
          ),
          Text(flag ? "已选中" : "未选中"),
          const SizedBox(height: 40),
          const Divider(),
          const SizedBox(height: 40),
          Text(
            "爱好:",
            style: Theme.of(context).textTheme.headline6,
          ),
          Column(
            children: _initHobby(),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              print(_hobby);
            },
            child: const Text("获取值"),
          )
        ],
      ),
    );
  }
}
