// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:web_pages/pages/login/login_page.dart';
import 'package:web_pages/screens/home_screen.dart';
import 'components.dart';
import 'components/widget/skyline.dart';
import 'components/widget/zoom.dart';
import 'core/utils/locale.dart';
import 'core/utils/toast.dart';
import 'generated/i18n.dart';
import 'pages/login/welcome_page.dart';
import 'router/route_map.dart';
import 'utils/provider.dart';
import 'utils/sputils.dart';

void main() {
  // runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  initFirst().then((_) => runApp(Store.init(ToastUtils.init(MyApp()))));
}


Future<void> initFirst() async {
  await SPUtils.init();
  await LocaleUtils.init();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI CAT',
      home: Scaffold(body: WelcomePage()),
    );
  }
}



class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<AppTheme, LocaleModel>(
        builder: (context, appTheme, localeModel, _) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Project',
            theme: ThemeData(
              brightness: appTheme.brightness,
              primarySwatch: appTheme.themeColor,
              buttonColor: appTheme.themeColor,
            ),
            getPages: RouteMap.getPages,
            defaultTransition: Transition.rightToLeft,
            locale: localeModel.getLocale(),
            supportedLocales: I18n.delegate.supportedLocales,
            localizationsDelegates: [
              I18n.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback:
                (Locale _locale, Iterable<Locale> supportedLocales) {
              if (localeModel.getLocale() != null) {
                //?????????????????????????????????????????????
                return localeModel.getLocale();
              } else {
                //????????????
                Locale systemLocale = LocaleUtils.getSystemLocale();
                if (I18n.delegate.isSupported(systemLocale)) {
                  return systemLocale;
                }
                return supportedLocales.first;
              }
            },
          );
        });
  }
}


