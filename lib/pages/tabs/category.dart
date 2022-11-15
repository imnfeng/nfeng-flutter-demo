import 'package:flutter/material.dart';
import '../search.dart';
import '../form.dart';
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
      ],
    ));
  }
}
