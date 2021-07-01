import 'package:flutter/material.dart';
import 'package:last_war/providers/student/student_courses_provider.dart';
import 'package:last_war/widgets/student/students_course_item.dart';
import 'package:provider/provider.dart';

class StudentCoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final extractedCourses = Provider.of<StudentCoursesProvider>(context)
        .getStudentCourses; //.getCourses;
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return StudentCourseItem(
                  examDate: extractedCourses[index]['examDate'] as String,
                  master: extractedCourses[index]['master'] as String,
                  course: extractedCourses[index]['course'] as String,
                  time: extractedCourses[index]['time'],
                );
              },
              itemCount: extractedCourses.length,
            ),
          ),
        ],
      ),
    );
  }
}
