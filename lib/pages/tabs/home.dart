import 'package:flutter/material.dart';
import '../../tools/keepAliveWrapper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
    _tabController.addListener(() {
      if (_tabController.animation!.value == _tabController.index) {
        print(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          elevation: 0.5,
          backgroundColor: Colors.white,
          title: SizedBox(
            height: 30,
            child: TabBar(
              labelStyle: const TextStyle(
                fontSize: 14,
              ),
              isScrollable: true,
              indicatorColor: Colors.red,
              labelColor: Colors.red,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              controller: _tabController,
              tabs: const [
                Tab(
                  child: Text("关注"),
                ),
                Tab(
                  child: Text("热门"),
                ),
                Tab(
                  child: Text("视频"),
                ),
                Tab(
                  child: Text("娱乐"),
                ),
                Tab(
                  child: Text("篮球"),
                ),
                Tab(
                  child: Text("深圳"),
                ),
                Tab(
                  child: Text("疫情"),
                ),
                Tab(
                  child: Text("其他"),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          KeepAliveWrapper(
            child: ListView(
              children: const [
                ListTile(title: Text("我是关注列表1")),
                ListTile(title: Text("我是关注列表2")),
                ListTile(title: Text("我是关注列表3")),
                ListTile(title: Text("我是关注列表4")),
                ListTile(title: Text("我是关注列表5")),
                ListTile(title: Text("我是关注列表6")),
                ListTile(title: Text("我是关注列表7")),
                ListTile(title: Text("我是关注列表8")),
                ListTile(title: Text("我是关注列表9")),
                ListTile(title: Text("我是关注列表10")),
                ListTile(title: Text("我是关注列表11")),
                ListTile(title: Text("我是关注列表12")),
                ListTile(title: Text("我是关注列表13")),
                ListTile(title: Text("我是关注列表14")),
                ListTile(title: Text("我是关注列表15")),
                ListTile(title: Text("我是关注列表16")),
                ListTile(title: Text("我是关注列表17")),
                ListTile(title: Text("我是关注列表18")),
                ListTile(title: Text("我是关注列表19")),
              ],
            ),
          ),
          const Text("我是热门"),
          const Text("我是视频"),
          const Text("我是娱乐"),
          const Text("我是篮球"),
          const Text("我是深圳"),
          const Text("我是疫情"),
          const Text("我是其他"),
        ],
      ),
    );
  }
}
