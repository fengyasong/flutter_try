import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class Skyline extends StatelessWidget {
  const Skyline({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List list=getContributions2();

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('贡献度',style: TextStyle(fontSize: 20),),
          SizedBox(height: 10,),
          //一列贡献
          SizedBox(
            height: 100,
            child: CustomScrollView(
              scrollDirection : Axis.horizontal,//横向滚动
              slivers:[
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => list[index],
                      childCount: list.length),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 20,
            child: Row(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Text('Less', style: TextStyle(fontSize: 10,color: Color(0xFF57606a))),
                ),
                ...colors.map((color) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                    width: 10,
                    height: 10,
                    color: color,
                  ),
                )).toList(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Text('More',style: TextStyle(fontSize: 10,color: Color(0xFF57606a))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

 List<Color> colors=[
  Color(0xFFebedf0),
  Color(0xFF9be9a8),
  Color(0xFF40c463),
  Color(0xFF30a14e),
  Color(0xFF216e39),
];

Color getColor(int count){
  switch (count) {
    case 0:
      return colors[0];
    case 1:
    case 2:
      return colors[1];
    case 3:
    case 4:
      return colors[2];
    case 5:
    case 6:
      return colors[3];
    default:
      return colors[4];
  }
}


List<Widget> getContributions2() {
  List<Widget> contributions = [];
  DateTime n = DateTime.now();
  DateTime begin=n.subtract(Duration(days: 365));
  int beginWeek=begin.weekday;
  for(int i=0;i<beginWeek;i++){
    contributions.add(Contribution(
      date: begin.subtract(Duration(days: beginWeek-i)),
      count: 0,
      show: false,
      onTap: (){},
    ));
  }
  while (begin.isBefore(n)) {
    contributions.add(Contribution(
      date: begin,
      count: begin.day%8,
      onTap: (){print('${begin.day%8}个贡献 ${formatDate(begin, [yyyy, '-', mm, '-', dd])}');},
    ));
    begin = begin.add(Duration(days: 1));
  }
  return contributions;
}

class Contribution extends StatelessWidget {
  const Contribution({Key? key, required this.date, required this.count,this.enabled=true,
    this.show=true,required this.onTap}) : super(key: key);

  final DateTime date;
  final int count;
  //是否可点击
  final bool enabled;
  final bool show;
  //点击事件
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        print('$count个贡献 ${formatDate(date, [yyyy, '-', mm, '-', dd])}');
      },
      child: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          color: show?getColor(count):null,
        ),
      ),
    );
  }
}
