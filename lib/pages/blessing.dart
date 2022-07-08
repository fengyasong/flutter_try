import 'package:flutter/material.dart';

class Blessing extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('祈福'),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Opacity(
              opacity: 0.5,
              child: Image.asset(
                  'images/qifu.png',
                  fit: BoxFit.cover,
                ),
              ),
            Padding(
              padding: EdgeInsets.only(
                left: 10,
                top: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      '风',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '调',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '雨',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '顺',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Text(
                      '国',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '泰',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '民',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '安',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}