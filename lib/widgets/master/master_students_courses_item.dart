import 'package:flutter/material.dart';

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
            content: null,
          ),
        );
      },
      child: FittedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
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
