import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_war/main.dart';
import 'package:last_war/models/enums.dart';
import 'package:last_war/providers/admin/admin_annoucement_provider.dart';
import 'package:last_war/widgets/shared/announcement_dialog.dart';
import 'package:provider/provider.dart';

class AdminAnnouncementScreen extends StatefulWidget {
  @override
  _AdminAnnouncementScreenState createState() =>
      _AdminAnnouncementScreenState();
}

class _AdminAnnouncementScreenState extends State<AdminAnnouncementScreen> {
  String _extractPreview(String sentence) {
    return '${sentence.substring(0, 35)}...';
  }

  List<String> _deletingAnnouncementIds = [];
  Map<int, Color> _colors = {};

  void _initializeColors(int len) {
    for (int i = 0; i < len; i++) {
      _colors[i] = Colors.green;
    }
  }

  void _changeIconColor(int index, announcementId) {
    if (_deletingAnnouncementIds.contains(announcementId)) {
      _deletingAnnouncementIds.remove(announcementId);
    } else {
      _deletingAnnouncementIds.add(announcementId);
    }
    setState(() {
      _colors[index] =
          _colors[index] == Colors.green ? Colors.red : Colors.green;
    });
  }

  @override
  void didChangeDependencies() {
    final announcementData =
        Provider.of<AdminAnnouncementProvider>(context, listen: false);
    _initializeColors(announcementData.getAnnouncements(null, null).length);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final announcementData =
        Provider.of<AdminAnnouncementProvider>(context, listen: false);
    final announcements =
        Provider.of<AdminAnnouncementProvider>(context, listen: false)
            .getAnnouncements(null, null);
    return Container(
      margin: EdgeInsets.only(top: 25),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: mediaQuery.size.height * 0.3,
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(4),
                        height: mediaQuery.size.height * 0.2,
                        width: 150,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            //TODO image
                            'https://i.ibb.co/ftmK4D5/cfae1f642850da600d18a38b55013a18.jpg'),
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
                          Text('${LastWar.user['code']}'),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 60,
                    bottom: 70,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                          '${LastWar.user['firstName']} ${LastWar.user['lastName']}'),
                      SizedBox(
                        height: mediaQuery.size.height * 0.015,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //TODO major
                            Text('Major'),
                            SizedBox(
                              height: mediaQuery.size.height * 0.02,
                            ),
                            //TODO number
                            Text('Admin Number'),
                          ],
                        ),
                      ),
                      Text('${LastWar.user['id']}')
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 60,
                      bottom: 70,
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: mediaQuery.size.height * 0.065,
                        ),
                        //TODO name
                        Text('FullName'),
                        SizedBox(
                          height: mediaQuery.size.height * 0.02,
                        ),
                        //TODO ID
                        Text('ID')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox( //
              height: mediaQuery.size.height * 0.015,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 6,
              color: Theme.of(context).accentColor,
              child: ListTile(
                leading: Container(
                    padding: EdgeInsets.all(5), child: Text('Announcement')),
                trailing: Container(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          showCupertinoDialog(
                            context: context,
                            builder: (ctx) => CupertinoAlertDialog(
                              title: Text('Deleting...'),
                              content: Text(
                                  'Are You Sure You Want to Delete Selected Announcements?'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      announcementData
                                          .deleteListOfAnnouncements(
                                              _deletingAnnouncementIds);
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Text('Yes')),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    child: Text('No')),
                              ],
                            ),
                          );
                        },
                        icon: Icon(Icons.delete),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              content: AnnouncementDialog(
                                dateTime: '',
                                title: '',
                                description: '',
                                editOrAdd: EditOrAdd.Add,
                                timeTableId: '',
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              //height: 20,
              height: mediaQuery.size.height*0.02,
            ),
            Card(
              elevation: 6,
              child: Container(
                height: mediaQuery.size.height*0.365,
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
                            content: AnnouncementDialog(
                              title: announcements[index]['title'] as String,
                              dateTime:
                                  announcements[index]['dateTime'] as String,
                              description:
                                  announcements[index]['description'] as String,
                              editOrAdd: EditOrAdd.Edit,
                              timeTableId: announcements[index]['timeTableId'],
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
                          title: Text(announcements[index]['title'] as String),
                          subtitle: Text(_extractPreview(
                              announcements[index]['description'] as String)),
                          trailing: IconButton(
                            onPressed: () {
                              _changeIconColor(
                                  index, announcements[index]['id']);
                            },
                            icon: Icon(
                              Icons.check_box_outlined,
                              color: _colors[index],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount:
                      announcementData.getAnnouncements(null, null).length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
