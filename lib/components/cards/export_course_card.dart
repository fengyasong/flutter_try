import 'package:flutter/cupertino.dart';
import 'package:web_pages/model/course.dart';

import '../../constants.dart';

class ExploreCourseCard extends StatelessWidget {

  final Course course;

  ExploreCourseCard({required this.course});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right:20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(41),
        child: Container(
          height: 120,
          width: 280,
          decoration: BoxDecoration(
            gradient: course.bgColor,
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 32),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(course.subTitle,style: kCardSubtitleStyle,),
                      SizedBox(height: 6,),
                      Text(course.title,style: kCardTitleStyle,)
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset('assets/images/qifu.png',fit:BoxFit.cover,width: 100,),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}