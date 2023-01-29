// import 'package:flutter/material.dart';

// import 'dart:js';

import 'dart:js';

import 'package:flutter/cupertino.dart';
import '../pages/dialog.dart';
import '../pages/user/registerSecond.dart';
import '../pages/user/registerThird.dart';
import '../pages/user/registerFirst.dart';
import '../pages/user/login.dart';
import '../pages/form.dart';
import '../pages/news.dart';
import '../pages/search.dart';
import '../pages/shop.dart';
import '../pages/tabs.dart';
import '../pages/view/pageView.dart';
import '../pages/view/pageViewBuilder.dart';
import '../pages/view/pageViewFullPage.dart';
import '../pages/view/pageViewImageList.dart';
import '../pages/view/pageViewKeepAlive.dart';
import '../pages/view/pageViewSwiper.dart';
import '../pages/view/widgetKey.dart';
import '../pages/animated/animatedList.dart';
import '../pages/animated/animatedFlag.dart';
import '../pages/animated/animatedController.dart';
import '../pages/animated/animatedBuilder.dart';
import '../pages/animated/hero.dart';
import '../pages/form/textField.dart';

Map routes = {
  "/": (context) => const Tabs(),
  "/news": (context) => const NewsPage(),
  "/search": (context) => const SearchPage(),
  "/dialog": (context) => const DialogPage(),
  "/form": (context, {arguments}) => FormPage(arguments: arguments),
  "/shop": (context, {arguments}) => ShopPage(arguments: arguments),
  "/login": (context) => const Login(),
  "/registerFirst": (context) => const RegisterFirstPage(),
  "/registerSecond": (context) => const RegisterSecoundPage(),
  "/registerThird": (context) => const RegisterThirdPage(),
  "/pageView": (context) => const PageViewPage(),
  "/pageViewBuilder": (context) => const PageViewBuilderPage(),
  "/pageViewFullPage": (context) => const PageViewFullPage(),
  "/pageViewImageList": (context) => const PageViewImageList(),
  "/pageViewKeepAlive": (context) => const PageViewKeepAlive(),
  "/pageViewSwiper": (context) => const PageViewSwiper(),
  "/widgetKey": (context) => const WidgetKeyPage(),
  "/animatedList": (context) => const AnimatedListPage(),
  "/animatedFlag": (context) => const AnimatedFlagPage(),
  "/animatedController": (context) => const AnimatedControllerPage(),
  "/animatedBuilder": (context) => const AnimatedBuilderPage(),
  "/hero": (context, {arguments}) => HeroPage(arguments: arguments),
  "/textField": (context) => const TextFieldPage(),
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
