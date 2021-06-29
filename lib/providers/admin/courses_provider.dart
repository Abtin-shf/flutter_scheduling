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
      'name': '',
      'classNumber': '',
      'capacity': '',
      'examDate': ''
    }, {
      'name': '',
      'classNumber': '',
      'capacity': '',
      'examDate': ''
    }, {
      'name': '',
      'classNumber': '',
      'capacity': '',
      'examDate': ''
    }, {
      'name': '',
      'classNumber': '',
      'capacity': '',
      'examDate': ''
    }, {
      'name': '',
      'classNumber': '',
      'capacity': '',
      'examDate': ''
    },
    {
      'name': '',
      'classNumber': '',
      'capacity': '',
      'examDate': ''
    }, {
      'name': '',
      'classNumber': '',
      'capacity': '',
      'examDate': ''
    },


  ];


  List<Map<String, String>> get getCourses {
    return [..._courses];
  }

}