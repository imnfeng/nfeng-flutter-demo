import 'package:flutter/material.dart';

class DateTimePage extends StatefulWidget {
  const DateTimePage({super.key});

  @override
  State<DateTimePage> createState() => _DateTimePageState();
}

class _DateTimePageState extends State<DateTimePage> {
  @override
  void initState() {
    super.initState();

    // 1、获取日期
    // DateTime d = DateTime.now();
    // print(d);

    // 2、获取时间戳
    // var str = "${d.year}-${d.month}-${d.day}-${d.hour}:${d.minute}:${d.second}";
    // print(str);

    // 3、日期转会成时间戳 时间戳转换成日期
    // DateTime dateTime = DateTime.now();
    // int time = dateTime.millisecondsSinceEpoch;
    // DateTime d = DateTime.fromMillisecondsSinceEpoch(time);
    // var str = "${d.year}-${d.month}-${d.day}-${d.hour}:${d.minute}:${d.second}";
    // print(str);

    // 4、日期字符串转换成时间
    // String str = "2023-08-01";
    // DateTime d = DateTime.parse(str);
    // print(d);
    // print(d.millisecondsSinceEpoch);
    // print(DateTime.parse("2021-08-01 12:01:30"));

    // DateTime d = DateTime(2030, 3, 24);
    // print(d);
    // print(d.millisecondsSinceEpoch);

    // 5、时间加减
    // DateTime d = DateTime.now();
    // print(d);
    // print(d.add(const Duration(days: 5)));
    // print(d.add(const Duration(minutes: 5)));
    // print(d.add(const Duration(minutes: -5)));

    // 6、TimeOfDay获取当前的时间
    TimeOfDay time = TimeOfDay.now();
    print(time);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
