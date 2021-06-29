import 'package:flutter/material.dart';

class MasterTimeTableItem extends StatelessWidget {
  final String course;
  final String classNumber;
  final String day;
  final String bell;

  MasterTimeTableItem({
    required this.course,
    required this.classNumber,
    required this.day,
    required this.bell,
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
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            course,
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          ),
          Text(day),
        ],
      ),
    );
  }
}
