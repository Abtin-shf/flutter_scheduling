import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AdminDataProvider with ChangeNotifier {
  final token = '';
  final globalEndPoint = 'http://bosh:8080/api';

  List<String> _dayItems = [
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday'
  ];
  List<String> _bellItems = [
    '8 - 10',
    '10-12',
    '14 - 16',
    '16 - 18',
  ];

  //should they be unique??
  List<String> _coursesItems = [
    'Algorithm',
    'CPU',
    'Architecture',
    'AI',
  ];

  void addDay(String label, String dayOfWeek) {
    http
        .post(
      Uri.parse('$globalEndPoint/Days'),
      body: json.encode({
        'label': label,
        'dayOfWeek': dayOfWeek,
      }),
    )
        .then((response) {
      //200 and non zero id is done or ok
      if (response.statusCode == 200 && json.decode(response.body)['id'] != 0) {
        //TODO Done Snackbar and stuff
      } else {
        //Not Done!
      }
    });
  }

  void addBell(String label, String bellOfDay) {
    http
        .post(
      Uri.parse('$globalEndPoint/Bells'),
      body: json.encode({
        'label': label,
        'dayOfWeek': bellOfDay,
      }),
    )
        .then((response) {
      //200 and non zero id is done or ok
      if (response.statusCode == 200 && json.decode(response.body)['id'] != 0) {
        //TODO Done Snackbar and stuff
      } else {
        //Not Done!
      }
    });
  }

  void addCourse() {
    //TODO Add Course
  }

  void editDay() {
    //TODO edit Day
  }

  void editBell() {
    //TODO edit bell
  }

  void editCourse() {
    //TODO edit course
  }

  void deleteDay() {
    //TODO delete day
  }

  void deleteBell() {
    //TODO delete bell
  }

  void deleteCourse() {
    //TODO delete course
  }

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
