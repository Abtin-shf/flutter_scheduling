import 'package:flutter/material.dart';
import 'package:last_war/screens/admin/admin_data_triple_screens.dart';

class AdminDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Day',
              ),
              Tab(text: 'Bell'),
              Tab(
                text: 'Courses',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AdminDataDayScreen(),
            AdminDataBellScreen(),
            AdminDataCoursesScreen(),
          ],
        ),
      ),
    );
  }
}
