import 'dart:async';

import 'package:flutter/material.dart';
import '../../widgit/swiper.dart';

class PageViewSwiper extends StatefulWidget {
  const PageViewSwiper({super.key});

  @override
  State<PageViewSwiper> createState() => _PageViewSwiperState();
}

class _PageViewSwiperState extends State<PageViewSwiper> {
  List<String> list = [];
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    list = const [
      "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/z78vVm.jpg",
      "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/2018_01_15_09_49_IMG_0374.JPG",
      "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/WeChat60ae4c5ba76ba411912150c3593d906d.png"
    ];
    Timer t = Timer.periodic(Duration(seconds: 3), (timer) {
      print("执行");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("PageViewSwiper")),
        body: ListView(
          children: [Swiper(list: list)],
        ));
  }
}
