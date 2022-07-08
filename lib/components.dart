import 'package:flutter/material.dart';
import 'package:web_pages/pages/basic_demo.dart';
import 'package:web_pages/pages/blessing.dart';
import 'package:web_pages/pages/grid_view_demo.dart';
import 'package:web_pages/pages/scaling.dart';
import 'package:web_pages/pages/snowman.dart';

import 'pages/index.dart';
import 'screens/home_screen.dart';

class Components extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('I AM AI CAT'),
          elevation: 0.0,
        ),
        body: ListView(
          children: [
            ListItem(
              title: 'SNH48 成员',
              page: GridViewDemo(),
              icon: Icon(Icons.bubble_chart),
            ),
            ListItem(
              title: '狂风暴雪',
              page: Snowman(),
              icon: Icon(Icons.star_rate_sharp),
            ),
            ListItem(
              title: '祈福',
              page: Blessing(),
              icon: Icon(Icons.wb_sunny_sharp),
            ),
            ListItem(
              title: '计数器',
              page: MyHomePage(title: 'Flutter Demo Home Page'),
              icon: Icon(Icons.add),
            ),
            ListItem(
              title: '缩放',
              page: Scaling(),
              icon: Icon(Icons.zoom_in),
            ),
            ListItem(
              title: '课程',
              page: HomeScreen(),
              icon: Icon(Icons.zoom_in),
            ),
            ListItem(
              title: 'HOME',
              page: MainHomePage(),
              icon: Icon(Icons.zoom_in),
            ),
            //Image.network('https://www.snh48.com/images/member/zp_10248.jpg'),
          ],
        ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;
  final Widget icon;

  const ListItem({Key ? key,required this.title,required this.page,required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: icon,
          title: Text(title),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black45,
            size: 22,
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => page),
            );
          },
          contentPadding: EdgeInsets.only(left: 16.0, right: 6.0),
        ),
        Divider(),
      ],
    );
  }
}
