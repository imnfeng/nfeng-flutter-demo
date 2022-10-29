import 'package:flutter/material.dart';
import './tabs/home.dart';
import './tabs/category.dart';
import './tabs/message.dart';
import './tabs/setting.dart';
import './tabs/user.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 9, vsync: this);
  }

  int _currentIndex = 0;
  final List<Widget> _pages = const [
    HomePage(),
    CategoryPage(),
    MessagePage(),
    SettingPage(),
    UserPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            print("左侧按钮图标");
          },
        ),
        backgroundColor: Colors.red,
        title: const Text("Flutter App"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print("更多");
            },
            icon: const Icon(Icons.more_horiz),
          )
        ],
        bottom: TabBar(
          isScrollable: true,
          indicatorColor: Colors.white,
          indicatorWeight: 2,
          indicatorPadding: const EdgeInsets.all(5),
          // indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.yellow,
          unselectedLabelColor: Colors.white,
          labelStyle: const TextStyle(
            fontSize: 14,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
          ),
          indicator: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
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
              child: Text("关注"),
            ),
            Tab(
              child: Text("热门"),
            ),
            Tab(
              child: Text("视频"),
            ),
            Tab(
              child: Text("关注"),
            ),
            Tab(
              child: Text("热门"),
            ),
            Tab(
              child: Text("视频"),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: UserAccountsDrawerHeader(
                    accountName: const Text("Nfeng"),
                    accountEmail: const Text("308561157@qq.com"),
                    otherAccountsPictures: [
                      Image.network(
                          "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/Wirf9X.png"),
                      Image.network(
                          "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/Wirf9X.png"),
                      Image.network(
                          "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/Wirf9X.png"),
                    ],
                    currentAccountPicture: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/Wirf9X.png"),
                    ),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://feng-1257981287.cos.ap-chengdu.myqcloud.com/uPic/z78vVm.jpg"),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.people),
              ),
              title: Text("个人中心"),
            ),
            const Divider(),
            const ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
              title: Text("系统设置"),
            ),
            const Divider(),
          ],
        ),
      ),
      endDrawer: const Drawer(child: Text("右侧侧边栏")),
      // body: _pages[_currentIndex],
      body: TabBarView(
        controller: _tabController,
        children: [
          const Text("我是关注"),
          const Text("我是关注"),
          const Text("我是关注"),
          const Text("我是关注"),
          const Text("我是关注"),
          const Text("我是关注"),
          const Text("我是关注"),
          ListView(
            children: const [
              ListTile(
                title: Text("我是热门列表"),
              ),
              ListTile(
                title: Text("我是热门列表"),
              ),
              ListTile(
                title: Text("我是热门列表"),
              ),
              ListTile(
                title: Text("我是热门列表"),
              ),
              ListTile(
                title: Text("我是热门列表"),
              ),
              ListTile(
                title: Text("我是热门列表"),
              ),
            ],
          ),
          ListView(
            children: const [
              ListTile(
                title: Text("我是视频列表"),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        iconSize: 35,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "首页",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "分类",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "消息",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "设置",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "用户",
          )
        ],
      ),
      floatingActionButton: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(top: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FloatingActionButton(
          backgroundColor: _currentIndex == 2 ? Colors.red : Colors.blue,
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              _currentIndex = 2;
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
