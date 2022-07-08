import 'package:flutter/material.dart';

class Scaling extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('缩放测试'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.lightBlueAccent,
          child: GestureDetector(
            onScaleUpdate: (ScaleUpdateDetails details){
              print(details);
            },
          ),
        ),
      ),
    );
  }

}