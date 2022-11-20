import 'package:flutter/material.dart';
import './tabs/home.dart';
import './tabs/category.dart';
import './tabs/message.dart';
import './tabs/setting.dart';
import './tabs/user.dart';
import './search.dart';
import './form.dart';

class Tabs extends StatefulWidget {
  final int index;
  const Tabs({super.key, this.index = 0});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int _currentIndex;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 9, vsync: this);
    _currentIndex = widget.index;
  }

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
        elevation: 1,
        backgroundColor: Colors.red,
        title: const Text("Flutter App"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const SearchPage();
                }),
              );
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const FormPage(
                    arguments: {
                      "title": "我是命名路由传值",
                      "aid": 20,
                    },
                  );
                }),
              );
            },
            icon: const Icon(Icons.more_horiz),
          )
        ],
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
      body: _pages[_currentIndex],
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "消息"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "用户")
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
