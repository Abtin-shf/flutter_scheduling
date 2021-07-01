import 'package:flutter/material.dart';
import 'package:last_war/screens/student/student_announcement_screen.dart';
import 'package:last_war/screens/student/student_courses_screen.dart';
import 'package:last_war/screens/student/student_timetable_screen.dart';
import 'package:last_war/screens/student/student_unitselection_screen.dart';


class StudentTabsScreen extends StatefulWidget {
  static const routName = '/student-tabs';

  @override
  _StudentTabsScreenState createState() => _StudentTabsScreenState();
}

class _StudentTabsScreenState extends State<StudentTabsScreen> {
  List<Widget> _pages = [];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  String get pageTitle {
    if (_selectedPageIndex == 0) {
      return 'Announcements';
    }
    if (_selectedPageIndex == 1) {
      return 'Time Table';
    }
    if (_selectedPageIndex == 2) {
      return 'Courses';
    }
    if (_selectedPageIndex == 3) {
      return 'Unit Selection';
    }
    return 'UnKnown';
  }

  @override
  void initState() {
    _pages = [
      StudentAnnouncementScreen(),
      StudentTimeTableScreen(),
      StudentCoursesScreen(),
      StudentUnitSelectionScreen()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Color.fromRGBO(200, 200, 200, 1);
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.all(4),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              //TODO image
              'https://i.ibb.co/QbzKX4v/Wings-Of-Freedom.jpg',
            ),
          ),
        ),
        title: Text(pageTitle),
        centerTitle: true,
        actions: <Widget>[
          FittedBox(
            child: Container(
              margin: EdgeInsets.only(right: 20),
              child: Column(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      //TODO password
                    },
                    icon: Icon(Icons.vpn_key_outlined),
                    iconSize: 30,
                  ),
                  SizedBox.shrink(),
                  Text(
                    'Edit',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.black,
        selectedItemColor: Theme.of(context).accentColor,
        //backgroundColor:Colors.black,
        backgroundColor: color,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            //     backgroundColor: color,
              backgroundColor: color,
              icon: Icon(
                Icons.notifications_none_rounded,
                size: 30,
              ),
              label: 'Announcements'),
          BottomNavigationBarItem(
              backgroundColor: color,
              //   backgroundColor: color,
              icon: Icon(
                Icons.schedule_rounded,
                size: 30,
              ),
              label: 'Time Table'),
          BottomNavigationBarItem(
            //    backgroundColor: color,
              backgroundColor: color,
              icon: Icon(
                Icons.format_list_bulleted_rounded,
                size: 30,
              ),
              label: 'Courses'),
          BottomNavigationBarItem(
            //    backgroundColor: color,
              backgroundColor: color,
              icon: Icon(
                Icons.checklist_rounded,
                size: 30,
              ),
              label: 'Unit Selection'),
        ],
      ),
    );
  }
}
