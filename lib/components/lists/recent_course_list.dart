import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_pages/components/cards/recent_course_card.dart';
import 'package:web_pages/model/course.dart';
import 'package:web_pages/screens/course_screen.dart';

class RecentCourseList extends StatefulWidget {
  @override
  _RecentCourseListState createState() => _RecentCourseListState();
}

class _RecentCourseListState extends State<RecentCourseList> {
  List<Container> indicators = [];
  int currentPage = 0;

  Widget updateIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: recentCourses.map((course) {
        int index = recentCourses.indexOf(course);
        return Container(
          width: 7,
          height: 7,
          margin: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index ? Colors.blue : Color(0xFFA6AEBD),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 320,
          width: double.infinity,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return Transform.scale(
                scale: currentPage==index?1:0.8,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> CourseScreen(course: recentCourses[index]),
                      fullscreenDialog: true,
                    ),);
                  },
                  child: Opacity(
                    opacity: currentPage==index?1:0.5,
                    child: RecentCourseCard(course: recentCourses[index]),
                  ),
                ),
              );
            },
            itemCount: recentCourses.length,
            controller: PageController(initialPage: 0, viewportFraction: 0.618),
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
        ),
        updateIndicators(),
      ],
    );
  }
}