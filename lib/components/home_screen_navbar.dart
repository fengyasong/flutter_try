import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_pages/components/search_field_widget.dart';
import 'package:web_pages/components/sidebar_button.dart';

import '../constants.dart';

class HomeScreenNavBar extends StatelessWidget {
  final VoidCallback  triggerAnimation;
  HomeScreenNavBar({required this.triggerAnimation});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SidebarButton(triggerAnimation: triggerAnimation,),
          SearchFieldWidget(),
          Icon(
            Icons.notifications,
            color: kPrimaryLabelColor,
          ),
          SizedBox(
            width: 16,
          ),
          CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('assets/images/qifu.png'),
          )
        ],
      ),
    );
  }
}