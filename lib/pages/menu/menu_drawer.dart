import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../core/utils/toast.dart';
import '../../generated/i18n.dart';
import '../../utils/provider.dart';
import 'about.dart';
import 'login.dart';
import 'settings.dart';
import 'sponsor.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserProfile, AppStatus>(builder: (BuildContext context,
        UserProfile value, AppStatus status, Widget? child) {
      return Drawer(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Container(
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.only(top: 40, bottom: 20),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('images/cat.jpg',),
                      )
                    ),
                    Expanded(
                        child: Text(
                      value.nickName != null
                          ? '白玉盘'
                          : I18n.of(context).title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ))
                  ],
                ),
              ),
              onTap: () {
                ToastUtils.toast("点击头像");
              },
            ),
            MediaQuery.removePadding(
              context: context,
              // DrawerHeader consumes top MediaQuery padding.
              removeTop: true,
              child: ListView(
                shrinkWrap: true, //为true可以解决子控件必须设置高度的问题
                physics: NeverScrollableScrollPhysics(), //禁用滑动事件
                scrollDirection: Axis.vertical, // 水平listView
                children: <Widget>[
                  //首页
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text(I18n.of(context).home),
                    onTap: () {
                      status.tabIndex = TAB_HOME_INDEX;
                      Navigator.pop(context);
                    },
                    selected: status.tabIndex == TAB_HOME_INDEX,
                  ),
                  ListTile(
                    leading: Icon(Icons.list),
                    title: Text(I18n.of(context).category),
                    onTap: () {
                      status.tabIndex = TAB_CATEGORY_INDEX;
                      Navigator.pop(context);
                    },
                    selected: status.tabIndex == TAB_CATEGORY_INDEX,
                  ),
                  ListTile(
                    leading: Icon(Icons.local_activity),
                    title: Text(I18n.of(context).activity),
                    onTap: () {
                      status.tabIndex = TAB_ACTIVITY_INDEX;
                      Navigator.pop(context);
                    },
                    selected: status.tabIndex == TAB_ACTIVITY_INDEX,
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text(I18n.of(context).message),
                    onTap: () {
                      status.tabIndex = TAB_MESSAGE_INDEX;
                      Navigator.pop(context);
                    },
                    selected: status.tabIndex == TAB_MESSAGE_INDEX,
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text(I18n.of(context).profile),
                    onTap: () {
                      status.tabIndex = TAB_PROFILE_INDEX;
                      Navigator.pop(context);
                    },
                    selected: status.tabIndex == TAB_PROFILE_INDEX,
                  ),
                  //设置、关于、赞助
                  Divider(height: 2.0, color: Colors.grey),
                  ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text(I18n.of(context).sponsor),
                    onTap: () {
                      Get.to(() => SponsorPage());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(I18n.of(context).settings),
                    onTap: () {
                      Get.to(() => SettingsPage());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.error_outline),
                    title: Text(I18n.of(context).about),
                    onTap: () {
                      Get.to(() => AboutPage());
                    },
                  ),
                  //退出
                  Divider(height: 1.0, color: Colors.grey),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text(I18n.of(context).logout),
                    onTap: () {
                      value.nickName = "";
                      Get.offAll(() => LoginPage());
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ));
    });
  }
}
