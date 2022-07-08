import 'dart:math';

import 'package:flutter/material.dart';

class CertificateViewer extends StatefulWidget {
  @override
  _CertificateViewerState createState() => _CertificateViewerState();
}

class _CertificateViewerState extends State<CertificateViewer> {
  final List<String> certificatePaths = [
    'assets/images/qifu.png',
    'assets/images/qifu.png',
    'assets/images/qifu.png',
  ];

  late Widget certificateViewer;

  @override
  void initState() {
    super.initState();
    List<Widget> imageChildren = [];

    certificatePaths.toList().asMap().forEach((key, certificate) {
      int angleDegree;
      if (key == certificatePaths.length) {
        angleDegree = 0;
      } else {
        angleDegree = Random().nextInt(20) - 10;
      }

      imageChildren.add(
        Transform.rotate(
            angle: angleDegree*(pi/180),
            child: Image.asset(
              certificate,
              alignment: Alignment.center,
              fit: BoxFit.cover,
            )),
      );
    });

    certificateViewer = Stack(
      children: imageChildren,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: certificateViewer,
    );
  }
}