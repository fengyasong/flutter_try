import 'package:flutter/material.dart';

import 'app_style.dart';
import 'widget/login_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset('assets/images/bg_login_header.png'),
          Column(
            children: [
              SizedBox(height: 320),
              ClipPath(
                clipper: LoginClipper(),
                child: LoginBodyWidget(),
              ),
            ],
          ),
          Positioned(
            top: 64,
            left: 28,
            child: BackIcon(),
          )
        ],
      ),
    );
  }
}


/// 登录页面内容体
class LoginBodyWidget extends StatelessWidget {
  const LoginBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.maxFinite,
      padding: EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 86),
          Text(
            'Login',
            style: kTitleTextStyle,
          ),
          SizedBox(height: 20),
          Text(
            'Your Email',
            style: kBodyTextStyle,
          ),
          SizedBox(height: 4),
          LoginInput(
            hintText: 'Email',
            prefixIcon: 'assets/icons/icon_email.png',
          ),
          SizedBox(height: 16),
          Text(
            'Your Password',
            style: kBodyTextStyle,
          ),
          SizedBox(height: 4),
          LoginInput(
            hintText: 'Password',
            prefixIcon: 'assets/icons/icon_pwd.png',
            obscureText: true,
          ),
          SizedBox(height: 32),
          LoginBtnIconWidget(),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}