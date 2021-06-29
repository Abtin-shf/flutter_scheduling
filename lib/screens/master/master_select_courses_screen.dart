import 'package:flutter/material.dart';
import 'package:last_war/screens/master/master_double_select_course_screens.dart';

class MasterSelectCoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Date & Time',
              ),
              Tab(text: 'Courses'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MasterSelectCourseDateAndTimeScreen(),
            MasterSelectCourseCoursesScreen(),
          ],
        ),
      ),
    );
  }
}
