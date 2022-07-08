import 'package:flutter/material.dart';
import 'package:web_pages/model/course.dart';

class CourseScreen extends StatefulWidget {

  final Course course;

  CourseScreen({required this.course});

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: ()=>Navigator.pop(context),
            child: Center(
              child: Text('金风玉露一相逢 便胜却人间无数'),
            ),
          ),
        ),
      ),
    );
  }
}
