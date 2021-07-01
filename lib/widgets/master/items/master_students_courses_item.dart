import 'package:flutter/material.dart';
import 'package:last_war/widgets/master/dialogs/master_students_course_students_dialog.dart';

class MasterStudentsCoursesItem extends StatelessWidget {
  final Map<String, dynamic> course;

  MasterStudentsCoursesItem({required this.course});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
          Size.fromWidth(250),
        ),
        backgroundColor:
            MaterialStateProperty.all<Color>(Theme.of(context).accentColor),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            content: MasterStudentsCourseStudentsDialog(course: course,),
          ),
        );
      },
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //mainAxisSize: MainAxisSize.min,
          children: [
            FittedBox(
              child: Text('${course['name']}'),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
