import 'package:flutter/material.dart';

class StudentTimeTableProvider with ChangeNotifier {
  List<Map<String, String>> _studentTimeTable = [
    {
      'id': '0',
      'day': 'Saturday',
      'bell': '8 - 10',
      'course': '',
      'master': '',
      'classNumber': ''
    },
    {
      'id': '1',
      'day': 'Saturday',
      'bell': '10 - 12',
      'course': 'CPU',
      'master': 'Moalemi',
      'classNumber': '235'
    },
    {
      'id': '2',
      'day': 'Saturday',
      'bell': '14 - 16',
      'course': '',
      'master': '',
      'classNumber': ''
    },
    {
      'id': '3',
      'day': 'Saturday',
      'bell': '16 - 18',
      'course': 'AI',
      'master': 'Agdasi',
      'classNumber': '267'
    },
    {
      'id': '4',
      'day': 'Sunday',
      'bell': '8 - 10',
      'course': '',
      'master': '',
      'classNumber': ''
    },
    {
      'id': '5',
      'day': 'Sunday',
      'bell': '10 - 12',
      'course': '',
      'master': '',
      'classNumber': ''
    },
    {
      'id': '6',
      'day': 'Sunday',
      'bell': '14 - 16',
      'course': 'Algorithm',
      'master': 'Tanha',
      'classNumber': '234'
    },
    {
      'id': '7',
      'day': 'Sunday',
      'bell': '16 - 18',
      'course': '',
      'master': '',
      'classNumber': ''
    },
    {
      'id': '8',
      'day': 'Monday',
      'bell': '8 - 10',
      'course': '',
      'master': '',
      'classNumber': ''
    },
    {
      'id': '9',
      'day': 'Monday',
      'bell': '10 - 12',
      'course': 'CPU',
      'master': 'Moalemi',
      'classNumber': '256'
    },
    {
      'id': '10',
      'day': 'Monday',
      'bell': '14 - 16',
      'course': '',
      'master': '',
      'classNumber': ''
    },
    {
      'id': '11',
      'day': 'Monday',
      'bell': '16 - 18',
      'course': 'Architecture',
      'master': 'Zolfi',
      'classNumber': '246'
    },
    {
      'id': '12',
      'day': 'Tuesday',
      'bell': '8 - 10',
      'course': 'Architecture',
      'master': 'Zolfi',
      'classNumber': '231'
    },
    {
      'id': '13',
      'day': 'Tuesday',
      'bell': '10 - 12',
      'course': '',
      'master': '',
      'classNumber': ''
    },
    {
      'id': '14',
      'day': 'Tuesday',
      'bell': '14 - 16',
      'course': '',
      'master': '',
      'classNumber': ''
    },
    {
      'id': '15',
      'day': 'Tuesday',
      'bell': '16 - 18',
      'course': 'Algorithm',
      'master': 'Tanha',
      'classNumber': '262'
    },
    {
      'id': '16',
      'day': 'Wednesday',
      'bell': '8 - 10',
      'course': 'AI',
      'master': 'Agdasi',
      'classNumber': '254'
    },
    {
      'id': '17',
      'day': 'Wednesday',
      'bell': '10 - 12',
      'course': '',
      'master': '',
      'classNumber': ''
    },
    {
      'id': '18',
      'day': 'Wednesday',
      'bell': '14 - 16',
      'course': '',
      'master': '',
      'classNumber': ''
    },
    {
      'id': '19',
      'day': 'Wednesday',
      'bell': '16 - 18',
      'course': '',
      'master': '',
      'classNumber': ''
    },
  ];

  List<Map<String, String>> get getStudentTimeTableData {
    return [..._studentTimeTable];
  }
}
