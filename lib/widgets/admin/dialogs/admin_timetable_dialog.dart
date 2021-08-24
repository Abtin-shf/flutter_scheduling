import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:last_war/providers/time_tables_provider.dart';
import 'package:provider/provider.dart';

class AdminTimeTableDialog extends StatelessWidget {
  final Map<String, String> day;
  final Map<String, String> bell;

  AdminTimeTableDialog({
    required this.day,
    required this.bell,
  });

  @override
  Widget build(BuildContext context) {
    List<dynamic> timeTables = Provider.of<TimeTablesProvider>(context)
        .getTimeTablesForSpecificTimeTableBellIds(
            context, bell['id'] as String, day['id'] as String);
    return Container(
      child: Container(
        height: 500,
        width: 300,
        child: Column(
          children: <Widget>[
            Text('${day['label']} : ${bell['label']}'),
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
                itemCount: timeTables.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
