import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'login_page.dart';
import 'widget/welcome_widget.dart';

// 欢迎页面
class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Column(
        children: [
          WelcomeHeaderWidget(),
          GradientBtnWidget(
            width: 208,
            child: BtnTextWhiteWidget(
              text: 'Sign up',
            ),
          ),
          SizedBox(height: 16),
          GestureDetector(
            child: LoginBtnWidget(),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return LoginPage();
                },
              ));
            },
          ),
          SizedBox(height: 16),
          Text(
            'Forgot password?',
            style: TextStyle(
              fontSize: 18,
              color: kTextColor,
            ),
          ),
          SizedBox(height: 54),
          Row(
            children: [
              Spacer(),
              LineWidget(),
              LoginTypeIconWidget(icon: 'assets/icons/logo_ins.png'),
              LoginTypeIconWidget(icon: 'assets/icons/logo_fb.png'),
              LoginTypeIconWidget(icon: 'assets/icons/logo_twitter.png'),
              LineWidget(),
              Spacer(),
            ],
          )
        ],
      ),
    );
  }
}