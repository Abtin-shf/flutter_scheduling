import 'package:flutter/material.dart';

class StudentCoursesProvider with ChangeNotifier {
  List<Map<String, dynamic>> _studentCourses = [
    {
      'course':'CPU',
      'examDate': '2021/06/28',
      'master': 'Moalemi',
      'time': [
        {
          'day': 'Saturday',
          'bell': '10 - 12',
          'classNumber': '235',
        },
        {
          'day': 'Monday',
          'bell': '10 - 12',
          'classNumber': '256',
        }
      ],
    },
    {
      'course':'Algorithm',
      'examDate': '2021/07/1',
      'master': 'Tanha',
      'time': [
        {
          'day': 'Sunday',
          'bell': '14 - 16',
          'classNumber': '234',
        },
        {
          'day': 'Tuesday',
          'bell': '16 - 18',
          'classNumber': '262',
        }
      ],
    },
    {
      'course':'AI',
      'examDate': '2021/07/4',
      'master': 'Agdasi',
      'time': [
        {
          'day': 'Saturday',
          'bell': '16 - 18',
          'classNumber': '267',
        },
        {
          'day': 'Wednesday',
          'bell': '8 - 10',
          'classNumber': '254',
        }
      ],
    },
    {
      'course':'Architecture',
      'examDate': '2021/07/7',
      'master': 'Zolfi',
      'time': [
        {
          'day': 'Monday',
          'bell': '16 - 18',
          'classNumber': '246',
        },
        {
          'day': 'Tuesday',
          'bell': '8 - 10',
          'classNumber': '231',
        },

      ],
    },

  ];

  List<Map<String, dynamic>> get getStudentCourses {
    return [..._studentCourses];
  }
}
