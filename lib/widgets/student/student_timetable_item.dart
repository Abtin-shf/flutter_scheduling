import 'package:flutter/material.dart';

class StudentTimeTableItem extends StatelessWidget {
  final String course;
  final String classNumber;
  final String master;
  final String day;
  final String bell;

  StudentTimeTableItem({
    required this.course,
    required this.classNumber,
    required this.day,
    required this.bell,
    required this.master,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Theme.of(context).primaryColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(bell),
          Text(
            classNumber,
            style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          Text(
            master,
            style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          Text(
            course,
            style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          Text(day),
        ],
      ),
    );
  }


}
