import 'package:flutter/material.dart';
import '/core/widget/list/list_item.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../generated/i18n.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String _versionName = '1.0.0';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(I18n.of(context).about)),
        body: Container(
            color: Colors.white,
            child: ListView(children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Image.asset(
                    'images/logo.png',
                    width: 80,
                    height: 80,
                  ),),
              Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Center(
                      child: Text(
                          "${I18n.of(context).versionName}: $_versionName",
                          style: TextStyle(
                              color: Colors.grey[600], fontSize: 17)))),
              SizedBox(height: 15),
              Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.all(15.0),
                child: Card(
                    color: Theme.of(context).primaryColor,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          ListItem(
                            icon: Icon(
                              Icons.assignment_ind,
                              color: Colors.white,
                            ),
                            title: I18n.of(context).author,
                            titleColor: Colors.white,
                            describe: '白玉盘',
                            describeColor: Colors.white,
                            onPressed: () {
                              launchUrl(Uri.parse('https://baike.baidu.com/item/%E5%8F%A4%E6%9C%97%E6%9C%88%E8%A1%8C/1714445'));
                            },
                          ),
                          ListItem(
                            icon: Icon(
                              Icons.http,
                              color: Colors.white,
                            ),
                            title: "Github",
                            titleColor: Colors.white,
                            describe:
                                'https://github.com/fengyasong/flutter_try',
                            describeColor: Colors.white,
                            onPressed: () {
                              launchUrl(Uri.parse('https://github.com/fengyasong/flutter_try'));
                            },
                          ),
                          ListItem(
                            icon: Icon(
                              Icons.update,
                              color: Colors.white,
                            ),
                            title: I18n.of(context).appupdate,
                            titleColor: Colors.white,
                            describeColor: Colors.white,
                            onPressed: () {
                              //XUpdate.checkUpdateWithErrorTip();
                            },
                          )
                        ],
                      ),
                    )),
              ),
            ])));
  }
}
