import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:web_pages/components/certificate_viewer.dart';
import 'package:web_pages/components/lists/continue_watching_list.dart';
import 'package:web_pages/constants.dart';
import 'package:web_pages/model/course.dart';

class ContinueWatchingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      backdropEnabled: true,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(34),
      ),
      color: kCardPopupBackgroundColor,
      boxShadow: [
        BoxShadow(color: kShadowColor, offset: Offset(0, -12), blurRadius: 32),
      ],
      minHeight: 50,
      maxHeight: MediaQuery.of(context).size.height * 0.75,
      panel: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 12),
              child: Container(
                height: 4,
                width: 42,
                decoration: BoxDecoration(
                    color: Color(0xFFC5CBD6),
                    borderRadius: BorderRadius.circular(2)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'Continue Watching',
              style: kTitle2Style,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ContinueWatchingList(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'Certificates',
              style: kTitle2Style,
            ),
          ),
          CertificateViewer(),
        ],
      ),
    );
  }
}