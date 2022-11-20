// import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../pages/user/registerSecond.dart';
import '../pages/user/registerThird.dart';
import '../pages/user/registerFirst.dart';
import '../pages/user/login.dart';
import '../pages/form.dart';
import '../pages/news.dart';
import '../pages/search.dart';
import '../pages/shop.dart';
import '../pages/tabs.dart';

Map routes = {
  "/": (context) => const Tabs(),
  "/news": (context) => const NewsPage(),
  "/search": (context) => const SearchPage(),
  "/form": (context, {arguments}) => FormPage(arguments: arguments),
  "/shop": (context, {arguments}) => ShopPage(arguments: arguments),
  "/login": (context) => const Login(),
  "/registerFirst": (context) => const RegisterFirstPage(),
  "/registerSecond": (context) => const RegisterSecoundPage(),
  "/registerThird": (context) => const RegisterThirdPage()
};

var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = CupertinoPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          CupertinoPageRoute(builder: (context) => pageContentBuilder(context));

      return route;
    }
  }
  return null;
};
