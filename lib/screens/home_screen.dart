
import 'package:flutter/material.dart';
import 'package:web_pages/components/home_screen_navbar.dart';
import 'package:web_pages/components/lists/explore_course_list.dart';
import 'package:web_pages/components/lists/recent_course_list.dart';
import 'package:web_pages/screens/sidebar_screen.dart';

import '../constants.dart';
import 'continue_watching_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late Animation<Offset> sidebarAnimation;
  late Animation<double> fadeAnimation;
  late AnimationController sidebarAnimationController;

  bool sidebarHidden = true;

  @override
  void initState() {
    super.initState();
    sidebarAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    sidebarAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: sidebarAnimationController,
      curve: Curves.easeInOut,
    ));

    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: sidebarAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    sidebarAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HomeScreenNavBar(
                      triggerAnimation: () {
                        setState(() {
                          sidebarHidden=!sidebarHidden;
                        });
                        sidebarAnimationController.forward();
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Recent',
                            style: kLargeTitleStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '23 courses, more coming',
                            style: kSubtitleStyle,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    RecentCourseList(),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 25, right: 20, left: 20, bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Explore',
                            style: kTitle1Style,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 60),
                      child: ExploreCourseList(),
                    ),
                  ],
                ),
              ),
            ),
            ContinueWatchingScreen(),
            IgnorePointer(
              ignoring: sidebarHidden,
              child: Stack(
                children: [
                  FadeTransition(
                    opacity: fadeAnimation,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          sidebarHidden=!sidebarHidden;
                        });
                        sidebarAnimationController.reverse();
                      },
                      child: Container(
                        color: Color.fromRGBO(36, 38, 41, 0.4),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: sidebarAnimation,
                    child: SafeArea(
                      child: SidebarScreen(),
                      bottom: false,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



