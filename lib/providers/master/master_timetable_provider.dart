import 'package:flutter/material.dart';

class MasterTimeTableProvider with ChangeNotifier {
  List<Map<String, String>> _masterTimeTable = [
    {
      'id': '0',
      'day': 'Saturday',
      'bell': '8 - 10',
      'course': '',
      'classNumber': ''
    },
    {
      'id': '1',
      'day': 'Saturday',
      'bell': '10 - 12',
      'course': 'CPU',
      'classNumber': '235'
    },
    {
      'id': '2',
      'day': 'Saturday',
      'bell': '14 - 16',
      'course': '',
      'classNumber': ''
    },
    {
      'id': '3',
      'day': 'Saturday',
      'bell': '16 - 18',
      'course': 'AI',
      'classNumber': '267'
    },
    {
      'id': '4',
      'day': 'Sunday',
      'bell': '8 - 10',
      'course': '',
      'classNumber': ''
    },
    {
      'id': '5',
      'day': 'Sunday',
      'bell': '10 - 12',
      'course': '',
      'classNumber': ''
    },
    {
      'id': '6',
      'day': 'Sunday',
      'bell': '14 - 16',
      'course': 'Algorithm',
      'classNumber': '234'
    },
    {
      'id': '7',
      'day': 'Sunday',
      'bell': '16 - 18',
      'course': '',
      'classNumber': ''
    },
    {
      'id': '8',
      'day': 'Monday',
      'bell': '8 - 10',
      'course': '',
      'classNumber': ''
    },
    {
      'id': '9',
      'day': 'Monday',
      'bell': '10 - 12',
      'course': 'CPU',
      'classNumber': '256'
    },
    {
      'id': '10',
      'day': 'Monday',
      'bell': '14 - 16',
      'course': '',
      'classNumber': ''
    },
    {
      'id': '11',
      'day': 'Monday',
      'bell': '16 - 18',
      'course': '',
      'classNumber': ''
    },
    {
      'id': '12',
      'day': 'Tuesday',
      'bell': '8 - 10',
      'course': '',
      'classNumber': ''
    },
    {
      'id': '13',
      'day': 'Tuesday',
      'bell': '10 - 12',
      'course': '',
      'classNumber': ''
    },
    {
      'id': '14',
      'day': 'Tuesday',
      'bell': '14 - 16',
      'course': '',
      'classNumber': ''
    },
    {
      'id': '15',
      'day': 'Tuesday',
      'bell': '16 - 18',
      'course': 'Algorithm',
      'classNumber': '262'
    },
    {
      'id': '16',
      'day': 'Wednesday',
      'bell': '8 - 10',
      'course': 'AI',
      'classNumber': '254'
    },
    {
      'id': '17',
      'day': 'Wednesday',
      'bell': '10 - 12',
      'course': '',
      'classNumber': ''
    },
    {
      'id': '18',
      'day': 'Wednesday',
      'bell': '14 - 16',
      'course': '',
      'classNumber': ''
    },
    {
      'id': '19',
      'day': 'Wednesday',
      'bell': '16 - 18',
      'course': '',
      'classNumber': ''
    },
  ];

  List<Map<String, String>> get getMasterTimeTableData {
    return [..._masterTimeTable];
  }
}
