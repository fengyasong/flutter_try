import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import 'provider.dart';

class SPUtils {

  SPUtils._internal();

  factory SPUtils() => _instance;

  static late final SPUtils _instance = SPUtils._internal();

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  //SPUtils._internal();

  static late SharedPreferences _spf;

  static Future<SPUtils> init() async {
    _spf = await SharedPreferences.getInstance();
    return _instance;
  }

  /*static late SharedPreferences _spf;

  static Future<SharedPreferences> init() async {
    //if (_spf == null) {
      _spf = await SharedPreferences.getInstance();
    //}
    return _spf;
  }*/

  ///主题
  static Future<bool> saveThemeIndex(int value) {
    return _spf.setInt('key_theme_color', value);
  }

  static int getThemeIndex() {
    if (_spf.containsKey('key_theme_color')) {
      return _spf.getInt('key_theme_color')!;
    }
    return 0;
  }

  ///深色模式
  static Future<bool> saveBrightness(bool isDark) {
    return _spf.setBool('key_brightness', isDark);
  }

  static Brightness getBrightness() {
    bool? isDark = _spf.containsKey('key_brightness')
        ? _spf.getBool('key_brightness')
        : false;
    return isDark !? Brightness.dark : Brightness.light;
  }

  ///语言
  static Future<bool> saveLocale(String locale) {
    return _spf.setString('key_locale', locale);
  }

  static String getLocale() {
    String? locale = _spf.getString('key_locale');
    if (locale == null) {
      locale = LOCALE_FOLLOW_SYSTEM;
    }
    return locale;
  }

  ///昵称
  static Future<bool> saveNickName(String nickName) {
    return _spf.setString('key_nickname', nickName);
  }

  static String? getNickName() {
    return _spf.getString('key_nickname');
  }

  ///是否同意隐私协议
  static Future<bool> saveIsAgreePrivacy(bool isAgree) {
    return _spf.setBool('key_agree_privacy', isAgree);
  }

  static bool isAgreePrivacy() {
    if (!_spf.containsKey('key_agree_privacy')) {
      return false;
    }
    return _spf.getBool('key_agree_privacy')!;
  }

  ///是否已登陆
  static bool isLogined() {
    String? nickName = getNickName();
    return nickName != null && nickName.isNotEmpty;
  }


  /// 用户token
  static Future<bool> saveUserToken(String token) {
    return _spf.setString('key_user_token', 'Bearer $token');
  }
  static String? getUserToken() {
    return _spf.getString('key_user_token');
  }
  /// 用户
  static Future<bool> saveUser(String user) {
    return _spf.setString('key_user', user);
  }
  static String? getUser() {
    return _spf.getString('key_user');
  }


  /// 是否首次打开
  static Future<bool> saveIsFirstOpen(bool isFirstOpen) {
    return _spf.setBool('key_is_first_open', isFirstOpen);
  }
  static bool isFirstOpen() {
    if (!_spf.containsKey('key_is_first_open')) {
      return true;
    }
    return _spf.getBool('key_is_first_open')!;
  }
}
