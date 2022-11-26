import 'package:flutter/material.dart';
import '../widgit/image.dart';

class PageViewSwiper extends StatefulWidget {
  const PageViewSwiper({super.key});

  @override
  State<PageViewSwiper> createState() => _PageViewSwiperState();
}

class _PageViewSwiperState extends State<PageViewSwiper> {
  List<Widget> list = [];
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    list = const [
      ImagePage(
          src:
              "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/yousef-espanioly-g1vMcIdygUU.jpg"),
      ImagePage(
          src:
              "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/2018_01_15_09_49_IMG_0374.JPG"),
      ImagePage(
          src:
              "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/WeChat60ae4c5ba76ba411912150c3593d906d.png")
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PageViewSwiper")),
      body: Stack(
        children: [
          SizedBox(
            height: 200,
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index % list.length;
                });
              },
              itemCount: 1000,
              itemBuilder: (context, index) {
                return list[index % list.length];
              },
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? Colors.blue : Colors.grey,
                    shape: BoxShape.circle,
                    // borderRadius: BorderRadius.circular(5),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
