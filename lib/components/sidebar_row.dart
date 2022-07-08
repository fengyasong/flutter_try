
import 'package:flutter/cupertino.dart';
import 'package:web_pages/constants.dart';
import 'package:web_pages/model/sidebar.dart';

class SidebarRow extends StatelessWidget {

  final SidebarItem item;

  const SidebarRow({Key? key,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            gradient: item.background,
          ),
          child: item.icon,
        ),
        SizedBox(width: 12),
        Container(
          child: Text(
            item.title,
            style: kCalloutLabelStyle,
          ),
        ),
      ],
    );
  }
}