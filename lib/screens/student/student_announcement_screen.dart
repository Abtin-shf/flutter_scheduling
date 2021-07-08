import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_war/providers/master/master_announcement_provider.dart';

import 'package:last_war/widgets/student/student_announcement_dialog.dart';

import 'package:provider/provider.dart';

class StudentAnnouncementScreen extends StatefulWidget {
  @override
  _StudentAnnouncementScreenState createState() =>
      _StudentAnnouncementScreenState();
}

class _StudentAnnouncementScreenState extends State<StudentAnnouncementScreen> {
  //TODO OOO
  final timetableIds=[];


  String _extractPreview(String sentence) {
    return '${sentence.substring(0, 35)}...';
  }

  @override
  Widget build(BuildContext context) {
    final announcementData =
        Provider.of<MasterAnnouncementProvider>(context, listen: false);
    return Container(
      margin: EdgeInsets.only(top: 25),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(4),
                        height: 150,
                        width: 150,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              //TODO image
                              'https://i.ibb.co/QbzKX4v/Wings-Of-Freedom.jpg'),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //TODO major
                            Text('Major'),
                            SizedBox(
                              height: 20,
                            ),
                            //TODO faculty
                            Text('Faculty'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Column(
                            children: <Widget>[
                              //TODO name
                              Text('FullName'),
                              SizedBox(
                                height: 20,
                              ),
                              //TODO ID
                              Text('ID'),
                            ],
                          ),
                        ),
                        //SizedBox(height: 100,),
                        Container(
                          margin: EdgeInsets.only(top:100,),
                          child: Column(
                            children: <Widget>[
                              //TODO name
                              Text('FullName'),
                              SizedBox(
                                height: 20,
                              ),
                              //TODO ID
                              Text('ID'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 6,
              color: Theme.of(context).accentColor,
              child: ListTile(
                title: Container(
                    padding: EdgeInsets.all(5),
                    child: Center(child: Text('Announcements'))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 6,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(25),
              // ),
              child: Container(
                height: 340,
                width: double.infinity,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            content: StudentAnnouncementDialog(
                              title: announcementData.getAnnouncements(timetableIds)[index]
                                  ['title'] as String,
                              dateTime: announcementData.getAnnouncements(timetableIds)[index]
                                  ['dateTime'] as String,
                              description:
                                  announcementData.getAnnouncements(timetableIds)[index]
                                      ['description'] as String,
                            ),
                          ),
                        );
                        //print(itemData['title']);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.black),
                        ),
                        child: ListTile(
                          title: Text(announcementData.getAnnouncements(timetableIds)[index]
                              ['title'] as String),
                          subtitle: Text(_extractPreview(
                              announcementData.getAnnouncements(timetableIds)[index]
                                  ['description'] as String)),
                        ),
                      ),
                    );
                  },
                  itemCount: announcementData.getAnnouncements(timetableIds).length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
