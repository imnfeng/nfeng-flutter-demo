import 'package:flutter/material.dart';
import '../search.dart';
import '../news.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) {
                return const SearchPage();
              }),
            );
          },
          child: const Text("搜索页面"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/news");
          },
          child: const Text("命名路由跳转news"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/form", arguments: {
              "title": "我是命名路由传值",
              "aid": 20,
            });
          },
          child: const Text("跳转到表单"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/shop", arguments: {
              "title": "shop传值",
              "aid": 20,
            });
          },
          child: const Text("命名路由传值Shop"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) {
                return const NewsPage(
                  title: "我是标题",
                  aid: 12,
                );
              }),
            );
          },
          child: const Text("跳转传值"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/dialog");
          },
          child: const Text("Dialog演示"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/pageView");
          },
          child: const Text("PageView演示"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/pageViewBuilder");
          },
          child: const Text("PageViewBuilder演示"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/pageViewFullPage");
          },
          child: const Text("PageViewFullPage无限加载"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/pageViewSwiper");
          },
          child: const Text("PageViewSwiper"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/pageViewKeepAlive");
          },
          child: const Text("PageViewKeepAlive"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/widgetKey");
          },
          child: const Text("WidgetKeyPage"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/animatedList");
          },
          child: const Text("AnimatedListPage"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/animatedFlag");
          },
          child: const Text("AnimatedFlagPage"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/animatedController");
          },
          child: const Text("AnimatedControllerPage"),
        ),
      ],
    ));
  }
}
