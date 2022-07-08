import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class SidebarButton extends StatelessWidget {

  final VoidCallback  triggerAnimation;
  SidebarButton({required this.triggerAnimation});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: triggerAnimation,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      constraints: BoxConstraints(maxHeight: 40, maxWidth: 40),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                  color: kShadowColor, offset: Offset(0, 12), blurRadius: 16),
            ]),
        child: Icon(Icons.apps),
        // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        padding: EdgeInsets.all(8),
      ),
    );
  }
}