import 'package:flutter/material.dart';
import 'package:web_pages/model/course.dart';

import '../../constants.dart';

class ContinueWatchingCard extends StatelessWidget {
  final Course course;

  ContinueWatchingCard({required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Stack(alignment: Alignment.topRight, children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 20),
          child: Container(
            decoration: BoxDecoration(
              gradient: course.bgColor,
              borderRadius: BorderRadius.circular(41),
              boxShadow: [
                BoxShadow(
                  color: course.bgColor.colors[0].withOpacity(0.3),
                  offset: Offset(0, 20),
                  blurRadius: 20,
                ),
                BoxShadow(
                  color: course.bgColor.colors[1].withOpacity(0.3),
                  offset: Offset(0, 20),
                  blurRadius: 20,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(41),
              child: Container(
                height: 140,
                width: 260,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(
                              'assets/images/qifu.png',
                              fit: BoxFit.cover,
                              height: 110,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
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
          padding:
          EdgeInsets.only(top: 12.5, bottom: 13.5, right: 20.5, left: 14.5),
        ),
      ]),
    );
  }
}