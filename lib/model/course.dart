import 'package:flutter/cupertino.dart';

class Course {
  String title;
  String subTitle;
  LinearGradient bgColor;
  String? illustration;
  String? logo;

  Course(
      {required this.title,
      required this.subTitle,
      required this.bgColor,
      this.illustration,
      this.logo});
}

List<Course> recentCourses = [
  Course(
    title: '呼风唤雨',
    subTitle: '12课时如何借东风',
    bgColor: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00AEFF),
        Color(0xFF0076FF),
      ],
    ),
  ),
  Course(
    title: 'Flutter for Designers',
    subTitle: '12 sections',
    bgColor: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFA7D75),
        Color(0xFFC23D61),
      ],
    ),
  ),
  Course(
    title: '骂人的艺术',
    subTitle: '我从未见过有如此厚颜无耻之人',
    bgColor: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFAD64A),
        Color(0xFFEA880F),
      ],
    ),
  ),
  Course(
    title: '有故事的人儿',
    subTitle: '听有故事的人讲故事',
    bgColor: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFC66BC0),
        Color(0xFFF326C7),
      ],
    ),
  ),
];


List<Course> exploreCourses = [
  Course(
    title: 'JAVA从入门到放弃',
    subTitle: '2 课时',
    bgColor: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00AEFF),
        Color(0xFF0076FF),
      ],
    ),
  ),
  Course(
    title: 'Flutter for Designers',
    subTitle: '12 sections',
    bgColor: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFA7D75),
        Color(0xFFC23D61),
      ],
    ),
  ),
  Course(
    title: '骂人的艺术',
    subTitle: '我从未见过有如此厚颜无耻之人',
    bgColor: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFAD64A),
        Color(0xFFEA880F),
      ],
    ),
  ),
  Course(
    title: '有故事的人儿',
    subTitle: '听有故事的人讲故事',
    bgColor: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFC66BC0),
        Color(0xFFF326C7),
      ],
    ),
  ),
];