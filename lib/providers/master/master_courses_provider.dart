import 'package:flutter/material.dart';

class MasterCoursesProvider with ChangeNotifier {
  List<Map<String, dynamic>> _masterCourses = [
    {
      'name': 'Algorithm',
      'classNumber': '256',
      'capacity': '65',
      'examDate': DateTime.now().toIso8601String(),
      'students': [
        {'name': 'Abtin Shafiei', 'code': '985361065'},
        {'name': 'Haleh Jalali', 'code': '985361012'},
        {'name': 'Afra Khosroshahian', 'code': '985361022'},
        {'name': 'Amin Farzane', 'code': '985367037'},

      ],
    },
    {
      'name': 'CPU',
      'classNumber': '257',
      'capacity': '65',
      'examDate': DateTime.now().toIso8601String(),
      'students': [
        {'name': 'Amin Farzane', 'code': '985367037'},
        {'name': 'Mahdi Chavoshi', 'code': '985367012'},
        {'name': 'Tohid Yagmuri', 'code': '985361035'},
        {'name': 'Yashar Masruri', 'code': '985361028'},
        {'name': 'Fateme Esmati', 'code': '985361043'},
        {'name': 'Bita Khashechian', 'code': '985361038'},
      ],
    },
    {
      'name': 'Architecture',
      'classNumber': '258',
      'capacity': '65',
      'examDate': DateTime.now().toIso8601String(),
      'students': [
        {'name': 'Abtin Shafiei', 'code': '985361065'},
        {'name': 'Tohid Yagmuri', 'code': '985361035'},
        {'name': 'Yashar Masruri', 'code': '985361028'},
        {'name': 'Fateme Esmati', 'code': '985361043'},
        {'name': 'Bita Khashechian', 'code': '985361038'},
      ],
    },
    {
      'name': 'AI',
      'classNumber': '259',
      'capacity': '65',
      'examDate': DateTime.now().toIso8601String(),
      'students': [
        {'name': 'Abtin Shafiei', 'code': '985361065'},
        {'name': 'Haleh Jalali', 'code': '985361012'},
        {'name': 'Afra Khosroshahian', 'code': '985361022'},
        {'name': 'Amin Farzane', 'code': '985367037'},
        {'name': 'Mahdi Chavoshi', 'code': '985367012'},
        {'name': 'Tohid Yagmuri', 'code': '985361035'},
        {'name': 'Yashar Masruri', 'code': '985361028'},
        {'name': 'Fateme Esmati', 'code': '985361043'},
        {'name': 'Bita Khashechian', 'code': '985361038'},
      ],
    },
  ];
  List<Map<String,dynamic>> get getMasterCourses{
    return [..._masterCourses];
  }
}
