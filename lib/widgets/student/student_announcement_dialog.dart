import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentAnnouncementDialog extends StatefulWidget {
  final String title;
  final String dateTime;
  final String description;

  StudentAnnouncementDialog({
    required this.title,
    required this.dateTime,
    required this.description,
  });

  @override
  _StudentAnnouncementDialogState createState() =>
      _StudentAnnouncementDialogState();
}

class _StudentAnnouncementDialogState extends State<StudentAnnouncementDialog> {
  Map<String, String> _announcementData = {
    'title': '',
    'description': '',
    'date': '',
    'course': '',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          height: 350,
          width: 300,
          padding: EdgeInsets.only(
            left: 5,
            right: 5,
            bottom: 5,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  width: double.infinity,
                  child: Text('${widget.title}'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('${widget.dateTime}'),
                SizedBox(
                  height: 20,
                ),
                Text('${widget.description}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
