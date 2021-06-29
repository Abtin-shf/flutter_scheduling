import 'package:flutter/material.dart';

class AdminDataProvider with ChangeNotifier {
  List<String> _dayItems = [
    'Saturday', 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'
  ];
  List<String> _bellItems = [
    '8 - 10', '10-12', '14 - 16', '16 - 18',
  ];
  List<String> _coursesItems = [
    'Algorithm', 'CPU', 'Architecture', 'AI',
  ];

  List<String> get getDayItems {
    return [..._dayItems];
  }
  List<String> get getBellItems {
    return [..._bellItems];
  }
  List<String> get getCoursesItems {
    return [..._coursesItems];
  }




}