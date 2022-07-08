import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components.dart';
import '../components/widget/sms_code/code.dart';
import '../pages/index.dart';
import '../pages/menu/about.dart';
import '../pages/menu/login.dart';
import '../pages/menu/settings.dart';
import '../pages/menu/sponsor.dart';
import '../pages/splash/intro_slide_page.dart';
import '../pages/splash/splash.dart';
import '../pages/splash/splash_screen.dart';

class RouteMap {
  static List<GetPage> getPages = [
    GetPage(name: '/', page: () => MainHomePage()),
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(name: '/home', page: () => MainHomePage()),
    GetPage(name: '/web', page: () => MainHomePage()),
    GetPage(name: '/menu/sponsor-page', page: () => SponsorPage()),
    GetPage(name: '/menu/settings-page', page: () => SettingsPage()),
    GetPage(name: '/menu/about-page', page: () => AboutPage()),

    //短信验证码登录
    GetPage(name: '/sms-login', page: () => Code()),
    GetPage(name: '/component', page: () => Components()),
    GetPage(name: '/splash', page: () => SplashScreenPage()),
    GetPage(name: '/introSlide', page: () => IntroSlidePage()),
  ];

  /// 页面切换动画
  static Widget getTransitions(
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2,
      Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
              //1.0为右进右出，-1.0为左进左出
              begin: Offset(1.0, 0.0),
              end: Offset(0.0, 0.0))
          .animate(
              CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
      child: child,
    );
  }
}
