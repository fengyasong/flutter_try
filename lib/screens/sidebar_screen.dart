import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_pages/components/sidebar_row.dart';
import 'package:web_pages/model/sidebar.dart';

import '../constants.dart';

class SidebarScreen extends StatelessWidget {
  const SidebarScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kSidebarBackgroundColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(34)
          )
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width*0.85,
      padding: EdgeInsets.symmetric(
          vertical: 35,
          horizontal: 20
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/qifu.png'),
                radius: 21,
              ),
              SizedBox(width: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('诸葛亮',style: kHeadlineLabelStyle,),
                  Text('东风到期还有3天',style: kSecondaryCalloutLabelStyle,),
                ],
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.08,),
          SidebarRow(item:sidebarItem[0]),
          SizedBox(height: 32,),
          SidebarRow(item:sidebarItem[1]),
          SizedBox(height: 32,),
          SidebarRow(item:sidebarItem[2]),
          SizedBox(height: 32,),
          SidebarRow(item:sidebarItem[3]),
          SizedBox(height: 32,),
          Spacer(),

          Row(
            children: [
              Text('退出',style: kSecondaryCalloutLabelStyle,),
            ],
          )
        ],
      ),
    );
  }
}