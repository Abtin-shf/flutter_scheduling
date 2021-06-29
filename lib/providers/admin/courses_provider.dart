import 'package:flutter/material.dart';

class CoursesProvider with ChangeNotifier {
  List<Map<String, String>> _courses = [
    {
      'name': 'Algorithm',
      'classNumber': '256',
      'capacity': '65',
      'examDate': DateTime.now().toIso8601String(),
    },
    {
      'name': 'Algorithm',
      'classNumber': '257',
      'capacity': '65',
      'examDate': DateTime.now().toIso8601String(),
    }, {
      'name': 'Algorithm',
      'classNumber': '258',
      'capacity': '65',
      'examDate': DateTime.now().toIso8601String(),
    }, {
      'name': 'Algorithm',
      'classNumber': '259',
      'capacity': '65',
      'examDate': DateTime.now().toIso8601String(),
    }, {
      'name': 'Algorithm',
      'classNumber': '260',
      'capacity': '65',
      'examDate': DateTime.now().toIso8601String(),
    }, {
      'name': 'Algorithm',
      'classNumber': '261',
      'capacity': '65',
      'examDate': DateTime.now().toIso8601String(),
    },
    {
      'name': 'Algorithm',
      'classNumber': '262',
      'capacity': '65',
      'examDate': DateTime.now().toIso8601String(),
    }, {
      'name': 'Algorithm',
      'classNumber': '263',
      'capacity': '65',
      'examDate': DateTime.now().toIso8601String(),
    }, {
      'name': 'Algorithm',
      'classNumber': '264',
      'capacity': '65',
      'examDate': DateTime.now().toIso8601String(),
    },

  ];


  List<Map<String, String>> get getCourses {
    return [..._courses];
  }

}