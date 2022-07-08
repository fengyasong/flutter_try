import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../api/other_repository.dart';
// import '../../core/utils/route_util.dart';
import '../../core/utils/utils.dart';
import '../../model/hitokoto.dart';
import '../../plugins/skip_down_time_progress.dart';
import '../../utils/sputils.dart';
import '../index.dart';
import '../menu/login.dart';
import 'intro_slide_page.dart';


class SplashScreenPage extends StatefulWidget {
  @override
  createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  /// 是否第一次打开APP
  late bool firstOpen;

  late Hitokoto? data;

  @override
  void initState() {
    super.initState();
    getHitokotoData();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Image.asset("images/splash.jpg", fit: BoxFit.cover)),
      Positioned(
          child: SkipDownTimeProgress(
              color: Colors.red,
              radius: 22.0,
              duration: Duration(seconds: 5),
              size: Size(25.0, 25.0),
              skipText: "跳过",
              onTap: () => goToHomePage(context),
              onFinishCallBack: (bool value) {
                if (value) goToHomePage(context);
              }),
          top: Utils.topSafeHeight + 20,
          right: 30),
      Positioned(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                child: Text('${data?.hitokoto ?? ""}',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 16,
                        height: 2.0,
                        decoration: TextDecoration.none))),
            Container(
                padding: EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                width: double.infinity,
                child:
                    Text('--${data?.from ?? ""}', style: TextStyle(fontSize: 14, color: Colors.grey)))
          ]),
          left: 0,
          right: 0,
          bottom: Utils.height / 2.2)
    ]);
  }

  void goToHomePage(BuildContext context) async {
    firstOpen = SPUtils.isFirstOpen();

    debugPrint("$firstOpen");
    if (!firstOpen) {
      Get.offNamed(SPUtils.isLogined() ? '/home' : '/login');
      /*if (SPUtils.isLogined()) {
        pushAndRemovePage(context, MainHomePage());
      } else {
        pushAndRemovePage(context, LoginPage());
      }*/
    } else {
      SPUtils.saveIsFirstOpen(false);
      //pushAndRemovePage(context, IntroSlidePage());
      Get.offNamed('introSlide');
    }
  }

  void getHitokotoData() async {
    data = await OtherRepository.hitokoto();
    if (mounted) {
      setState(() {});
    }
  }
}
