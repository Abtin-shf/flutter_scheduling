import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminTimeTableDialog extends StatelessWidget {
  final String day;
  final String bell;
  final List<Map<String, String>> items;

  AdminTimeTableDialog({
    required this.day,
    required this.bell,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 500,
        width: 300,
        child: Column(
          children: <Widget>[
            Text('$day : $bell'),
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
                     bottom: BorderSide(width: 1, color: Theme.of(context).primaryColor),
                    ),
                  ),
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Master : ${items[index]['master']}'),
                        SizedBox(
                          height: 3,
                        ),
                        Text('Course : ${items[index]['course']}'),
                        SizedBox(
                          height: 3,
                        ),
                        Text('Class Number : ${items[index]['classNumber']}'),
                      ],
                    ),
                  ),
                ),
                itemCount: items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
