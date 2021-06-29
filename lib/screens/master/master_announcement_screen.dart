import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_war/providers/master/master_announcement_provider.dart';
import 'package:last_war/widgets/shared/announcement_dialog.dart';

import 'package:provider/provider.dart';

class MasterAnnouncementScreen extends StatefulWidget {
  @override
  _MasterAnnouncementScreenState createState() =>
      _MasterAnnouncementScreenState();
}

class _MasterAnnouncementScreenState extends State<MasterAnnouncementScreen> {
  String _extractPreview(String sentence) {
    return '${sentence.substring(0, 35)}...';
  }

  Map<int, Color> _colors = {};

  void _initializeColors(int len) {
    for (int i = 0; i < len; i++) {
      _colors[i] = Colors.green;
    }
  }

  void _changeIconColor(int index) {
    setState(() {
      _colors[index] = _colors[index] == Colors.green ? Colors.red : Colors.green;
    });
  }

  @override
  void didChangeDependencies() {
    final announcementData =
    Provider.of<MasterAnnouncementProvider>(context, listen: false);
    _initializeColors(announcementData.getAnnouncements.length);
    super.didChangeDependencies();
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
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(4),
                      height: 150,
                      width: 150,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          //TODO image
                            'https://i.ibb.co/CP3ZSVp/f5243de6d4855da804f7d83d1770858b.jpg'),
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
                          //TODO number
                          Text('MasterNumber'),
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
                      //TODO name
                      Text('FullName'),
                      SizedBox(
                        height: 20,
                      ),
                      //TODO ID
                      Text('ID')
                    ],
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
                              content:
                              Text('Are You Sure You Want to Delete Selected Announcements?'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                      // TODO DELETE
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
                            content: AnnouncementDialog(
                              title: announcementData.getAnnouncements[index]
                              ['title'] as String,
                              dateTime: announcementData.getAnnouncements[index]
                              ['dateTime'] as String,
                              description:
                              announcementData.getAnnouncements[index]
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
                          title: Text(announcementData.getAnnouncements[index]
                          ['title'] as String),
                          subtitle: Text(_extractPreview(
                              announcementData.getAnnouncements[index]
                              ['description'] as String)),
                          trailing: IconButton(
                            onPressed: () {
                              _changeIconColor(index);
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
                  itemCount: announcementData.getAnnouncements.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
