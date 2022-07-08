import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_pages/model/course.dart';

import '../../constants.dart';

class RecentCourseCard extends StatelessWidget {
  Course course;

  RecentCourseCard({required this.course});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topRight, children: [
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          width: 240,
          height: 240,
          decoration: BoxDecoration(
            gradient: course.bgColor,
            borderRadius: BorderRadius.circular(41),
            boxShadow: [
              BoxShadow(
                  color: course.bgColor.colors[0].withOpacity(0.3),
                  offset: Offset(0, 20),
                  blurRadius: 30),
              BoxShadow(
                  color: course.bgColor.colors[1].withOpacity(0.3),
                  offset: Offset(0, 20),
                  blurRadius: 30),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 32, right: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.subTitle,
                      style: kCardSubtitleStyle,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      course.title,
                      style: kCardTitleStyle,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Image.asset(
                  'assets/images/qifu.png',
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 42),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                    color: kShadowColor, offset: Offset(0, 4), blurRadius: 16)
              ]),
          child: FlutterLogo(),
          padding: EdgeInsets.all(8),
        ),
      ),
    ]);
  }
}