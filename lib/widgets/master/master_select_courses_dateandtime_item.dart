import 'package:flutter/material.dart';

class MasterSelectCoursesDateAndTimeItem extends StatelessWidget {
  final String course;
  final String classNumber;
  final String day;
  final String bell;

  MasterSelectCoursesDateAndTimeItem({
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
          Icon(Icons.check_box_outlined),
          Text(day),
        ],
      ),
    );
  }
}
