import 'dart:math';

import 'package:flutter/material.dart';

class Snowman extends StatefulWidget {

  @override
  _SnowmanState createState() => _SnowmanState();
}

class _SnowmanState extends State<Snowman> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  List<Snowflake> _list = List.generate(500, (index) => Snowflake());

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 2200),
       )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('snowman'),
      ),*/
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blueAccent,Colors.lightBlueAccent,Colors.white],
              stops: [0,0.7,0.97],
            ),
          ),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: SnowmanPrinter(_list),
              );
            },
          ),
        ),
      ),
    );
  }
}



class SnowmanPrinter extends CustomPainter{
  List<Snowflake> snowflakes;
  SnowmanPrinter(this.snowflakes);

  @override
  void paint(Canvas canvas, Size size) {

    double minSize = min(size.height, size.width);

    Paint whitePaint = Paint()..color=Colors.white;
    //画头部
    canvas.drawCircle(size.bottomCenter(Offset(0, -minSize*85/100)), minSize/6, whitePaint);
    //画身子
    canvas.drawOval(
      Rect.fromCenter(center: size.bottomCenter(Offset(0, -minSize/4)), width: minSize*3/4,height: minSize),
      whitePaint,
    );

    snowflakes.forEach((snowflake) {
      //画雪花
      full(snowflake,size.width,size.height);//下落
      canvas.drawCircle(Offset(snowflake.x,snowflake.y), snowflake.size, whitePaint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>true;


  full(Snowflake snowflake,double width,double height){
    snowflake.x+=1;
    snowflake.y+=snowflake.v;
    if(snowflake.y>height){
      snowflake.y=0;
      snowflake.x=Random().nextDouble()*width;
      snowflake.size=Random().nextDouble()*5+1;
      snowflake.v=Random().nextDouble()*4+3;
    }else if(snowflake.x>width){
      snowflake.x=0;
    }
  }
}

///雪花
class Snowflake {
  /// x,y坐标位置，size大小，v下落速度
  double x=Random().nextDouble()*500;
  double y=Random().nextDouble()*800;
  double size=Random().nextDouble()*2+1;
  double v=Random().nextDouble()*4+3;




}
///风
class Wind{
  ///风向，风力
  double direction,power;

  Wind(this.direction,this.power);
}