// import 'dart:js';

import 'package:flutter/cupertino.dart';
import '../pages/dialog.dart';
import '../pages/user/registerSecond.dart';
import '../pages/user/registerThird.dart';
import '../pages/user/registerFirst.dart';
import '../pages/user/login.dart';
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
import '../pages/animated/loading.dart';
import '../pages/animated/future.dart';
import '../pages/animated/stream.dart';
import '../pages/animated/game.dart';
import '../pages/form/form.dart';
import '../pages/form/textField.dart';
import '../pages/form/radio.dart';
import '../pages/form/checkbox.dart';
import '../pages/form/checkboxListTitle.dart';
import '../pages/form/switch.dart';
import '../pages/form/dateTime.dart';
import '../pages/form/showDatePicker.dart';
import '../pages/dio/dio.dart';
import '../pages/dio/restful.dart';
import '../pages/dio/jsonMap.dart';
import '../pages/dio/dioGetCategory.dart';
import '../pages/dio/dioAndFutureBuild.dart';
import '../pages/dio/dioNews.dart';
import '../pages/dio/dioNewsContent.dart';
import '../pages/device/tab.dart';
import '../pages/device/device.dart';
import '../pages/device/network.dart';
import '../pages/device/urlLauncher.dart';

Map routes = {
  "/": (context) => const Tabs(),
  "/news": (context) => const NewsPage(),
  "/search": (context) => const SearchPage(),
  "/dialog": (context) => const DialogPage(),
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
  "/loading": (context) => const LoadingPage(),
  "/future": (context) => const FuturePage(),
  "/stream": (context) => const StreamPage(),
  "/game": (context) => const GamePage(),
  "/form": (context, {arguments}) => FormPage(arguments: arguments),
  "/textfield": (context) => const TextFieldPage(),
  "/radio": (context) => const RadioPage(),
  "/checkbox": (context) => const CheckboxPage(),
  "/checkboxListTile": (context) => const CheckboxListTilePage(),
  "/switch": (context) => const SwitchPage(),
  "/dateTime": (context) => const DateTimePage(),
  "/showDatePicker": (context) => const ShowDateTimePickerPage(),
  "/dio": (context) => const DioPage(),
  "/restful": (context) => const RestfulPage(),
  "/jsonMap": (context) => const JsonMapPage(),
  "/dioGetCategory": (context) => const DioGetCategoryPage(),
  "/dioGetCategoryWithFutureBuilder": (context) =>
      const DioAndFutureBuilderGetCategory(),
  "/dioNews": (context) => const DioNewsPage(),
  "/newsContent": (context, {arguments}) =>
      NewsContentPage(arguments: arguments),
  "/tabDevice": (context) => const TabDevicePage(),
  "/device": (context) => const DevicePage(),
  "/network": (context) => const NetworkPage(),
  "/urlLauncher": (context) => const UrlLauncherPage(),
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
