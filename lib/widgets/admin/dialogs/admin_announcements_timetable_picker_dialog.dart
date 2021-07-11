import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_war/providers/time_tables_provider.dart';
import 'package:last_war/widgets/shared/announcement_dialog.dart';
import 'package:provider/provider.dart';

class AdminAnnouncementTimeTablePickerDialog extends StatelessWidget {
  void _chooseTimeTable(ctx, timeTable) {
    AnnouncementDialog.timeTable = timeTable;
    Navigator.of(ctx).pop();
  }

  @override
  Widget build(BuildContext context) {
    final timeTables = Provider.of<TimeTablesProvider>(context)
        .getTimeTables(null, null, null);
    return Container(
      child: Container(
        height: 500,
        width: 300,
        child: Column(
          children: <Widget>[
            Text('Pick TimeTable'),
            Divider(
              thickness: 4.0,
              color: Theme.of(context).accentColor,
              endIndent: 50,
              indent: 50,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 430,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (ctx, index) => Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1, color: Theme.of(context).primaryColor),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: ctx,
                        builder: (ct) => CupertinoAlertDialog(
                          content: Text(
                              'Choosing TimeTable ${timeTables[index]['course']['title']} With'
                              ' ${timeTables[index]['master']['user']['firstName']} ${timeTables[index]['master']['user']['lastName']} '),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Text('Cancel')),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                  _chooseTimeTable(context, timeTables[index]);
                                },
                                child: Text('Choose')),
                          ],
                        ),
                      );
                    },
                    child: ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Master : ${timeTables[index]['master']['user']['firstName']} ${timeTables[index]['master']['user']['lastName']}'),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'Course : ${timeTables[index]['course']['title']}',
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text('Class Number : Online Classes!'),
                        ],
                      ),
                    ),
                  ),
                ),
                itemCount: timeTables.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
