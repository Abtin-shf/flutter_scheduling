import 'package:flutter/material.dart';

class StudentCourseItem extends StatelessWidget {
  final String master;
  final String course;
  final String examDate;
  final List<Map<String, String>> time;

  StudentCourseItem(
      {required this.master,
      required this.examDate,
      required this.course,
      required this.time});

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
            Text('Master: $master'),
            Text('Exam Date:$examDate'),
            Text(
                'Class Time & Number:\n'
                    '  \"${time[0]['day']}\" / ${time[0]['bell']} / ${time[0]['classNumber']}'
                    '\n'
                '  \"${time[1]['day']}\" / ${time[1]['bell']} / ${time[1]['classNumber']}'),

          ],
        ),
      ),
    );
  }
}
