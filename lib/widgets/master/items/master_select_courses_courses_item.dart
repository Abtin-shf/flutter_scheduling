import 'package:flutter/material.dart';

class MasterSelectCoursesCoursesItem extends StatelessWidget {
  final String name;
  final String classNumber;
  final String capacity;
  final String examDate;

  MasterSelectCoursesCoursesItem(
      {required this.name,
      required this.classNumber,
      required this.capacity,
      required this.examDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
      ),
      child: ListTile(

        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Course: $name'),
            Text('Capacity: $capacity'),
            Text('Class: $classNumber'),
            Text('Exam Date:$examDate'),
          ],
        ),
        trailing: IconButton(
          onPressed: (){
            //TODO
          },
          icon:Icon(Icons.check_box_outlined),
        ),
      ),
    );
  }
}
