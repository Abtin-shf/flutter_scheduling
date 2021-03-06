import 'package:flutter/material.dart';
import 'package:last_war/providers/master/master_courses_provider.dart';
import 'package:last_war/widgets/master/items/master_students_courses_item.dart';
import 'package:provider/provider.dart';

class MasterStudentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final extractedCourses = Provider.of<MasterCoursesProvider>(context).getMasterCourses;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: extractedCourses
            .map((course) => MasterStudentsCoursesItem(course: course))
            .toList(),
      ),
    );
  }
}
