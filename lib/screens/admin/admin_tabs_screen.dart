import 'package:flutter/material.dart';
import 'package:last_war/screens/admin/admin_announcment_screen.dart';
import 'package:last_war/screens/admin/admin_data_screen.dart';
import 'package:last_war/screens/admin/admin_students_screen.dart';
import 'package:last_war/screens/admin/admin_timetable_screen.dart';

class AdminTabsScreen extends StatefulWidget {
  static const routName = '/admin-tabs';

  @override
  _AdminTabsScreenState createState() => _AdminTabsScreenState();
}

class _AdminTabsScreenState extends State<AdminTabsScreen> {
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
      return 'Data';
    }
    if (_selectedPageIndex == 3) {
      return 'Students';
    }
    return 'UnKnown';
  }

  @override
  void initState() {
    _pages = [
      AdminAnnouncementScreen(),
      AdminTimeTableScreen(),
      AdminDataScreen(),
      AdminStudentsScreen(),
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
                'https://i.ibb.co/ftmK4D5/cfae1f642850da600d18a38b55013a18.jpg'),
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
                      //TODO EDIT PASSWORD
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
                Icons.edit,
                size: 30,
              ),
              label: 'Data'),
          BottomNavigationBarItem(
              //    backgroundColor: color,
              backgroundColor: color,
              icon: Icon(
                Icons.format_list_bulleted_rounded,
                size: 30,
              ),
              label: 'Students'),
        ],
      ),
    );
  }
}
