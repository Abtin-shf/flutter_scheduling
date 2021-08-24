import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

class AdminDataProvider with ChangeNotifier {
  final token = LastWar.token;
  final endPoint = LastWar.dns;

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

  List<String> _coursesItems = [
    'Algorithm',
    'CPU',
    'Architecture',
    'AI',
  ];

//=============================Days======================================
  Future<void> addDay(String label, String dayOfWeek) async {
    final response = await http.post(
      Uri.parse('$endPoint/Days'),
      body: json.encode({
        'label': label,
        'dayOfWeek': dayOfWeek,
      }),
      headers: {'Authorization': 'Mazalax $token'},
    );
    //200 and non zero id is done or ok
    if (response.statusCode == 200 && json.decode(response.body)['id'] != 0) {
      //TODO Done Snackbar and stuff
    } else {
      //Not Done!
    }
  }

  Future<void> editDay(String id, String label, String dayOfWeek) async {
    final response = await http.put(
      Uri.parse('$endPoint/Days/$id'),
      body: json.encode({
        'label': label,
        'dayOfWeek': dayOfWeek,
      }),
      headers: {'Authorization': 'Mazalax $token'},
    );
    if (response.statusCode == 200) {
      //TODO Snack Bar done!
    } else {
      //TODO Not Done!
    }
  }

  void deleteDay(String id) {
    http.delete(
      Uri.parse('$endPoint/Days/$id'),
      headers: {'Authorization': 'Mazalax $token'},
    );
  }

  List<dynamic> get getDays {
    final days = [];
    http.get(
      Uri.parse('$endPoint/Days?Page=1&PageSize=2147483647'),
      headers: {'Authorization': 'Mazalax $token'},
    ).then((response) {
      days.addAll(json.decode(response.body).list);
    });
    return days;
  }

  Map<String, String> getSingleDay(String id) {
    Map<String, String> day = {};
    http.get(
      Uri.parse('$endPoint/Days/$id'),
      headers: {'Authorization': 'Mazalax $token'},
    ).then((response) {
      day = json.decode(response.body);
    });
    return day;
  }

//=============================Days======================================
//=============================Bells======================================
  Future<void> addBell(String label, String bellOfDay) async {
    final response = await http.post(
      Uri.parse('$endPoint/Bells'),
      body: json.encode({
        'label': label,
        'dayOfWeek': bellOfDay,
      }),
      headers: {'Authorization': 'Mazalax $token'},
    );

    //200 and non zero id is done or ok
    if (response.statusCode == 200 && json.decode(response.body)['id'] != 0) {
      //TODO Done Snackbar and stuff
    } else {
      //Not Done!
    }
  }

  Future<void> editBell(String id, String label, String bellOfDay) async {
    final response = await http.put(
      Uri.parse('$endPoint/Bells/$id'),
      body: json.encode({
        'label': label,
        'bellOfDay': bellOfDay,
      }),
      headers: {'Authorization': 'Mazalax $token'},
    );
    if (response.statusCode == 200) {
      //TODO Snack Bar done!
    } else {
      //TODO Not Done!
    }
  }

  void deleteBell(String id) {
    http.delete(
      Uri.parse('$endPoint/Bells/$id'),
      headers: {'Authorization': 'Mazalax $token'},
    );
  }

  List<dynamic> get getBells {
    final bells = [];
    http.get(
      Uri.parse('$endPoint/Bells?Page=1&PageSize=2147483647'),
      headers: {'Authorization': 'Mazalax $token'},
    ).then((response) {
      bells.addAll(json.decode(response.body).list);
    });
    return bells;
  }

  Map<String, String> getSingleBell(String id) {
    Map<String, String> bell = {};
    http.get(
      Uri.parse('$endPoint/Bells/$id'),
      headers: {'Authorization': 'Mazalax $token'},
    ).then((response) {
      bell = json.decode(response.body);
    });
    return bell;
  }

//=============================Bells======================================
//=============================Courses======================================
  Future<void> addCourse(String title, String unitsCount) async {
    final response = await http.post(
      Uri.parse('$endPoint/Courses'),
      body: json.encode({
        'title': title,
        'unitsCount': unitsCount,
      }),
      headers: {'Authorization': 'Mazalax $token'},
    );

    //200 and non zero id is done or ok
    if (response.statusCode == 200 && json.decode(response.body)['id'] != 0) {
      //TODO Done Snackbar and stuff
    } else {
      //Not Done!
    }
  }

  Future<void> editCourse(String id, String title, String unitsCount) async {
    final response = await http.put(
      Uri.parse('$endPoint/Courses/$id'),
      body: json.encode({
        'title': title,
        'unitsCount': unitsCount,
      }),
      headers: {'Authorization': 'Mazalax $token'},
    );
    if (response.statusCode == 200) {
      //TODO Snack Bar done!
    } else {
      //TODO Not Done!
    }
  }

  void deleteCourse(String id) {
    http.delete(
      Uri.parse('$endPoint/Courses/$id'),
      headers: {'Authorization': 'Mazalax $token'},
    );
  }

  List<dynamic> getCourses(String? search, String? unitCount) {
    final courses = [];
    String query = 'search=$search&unitCount=$unitCount&';
    if (search == null && unitCount == null) {

    }
    http.get(
      Uri.parse('$endPoint/Courses?$query''Page=1&PageSize=2147483647'),
      headers: {'Authorization': 'Mazalax $token'},
    ).then((response) {
      courses.addAll(json.decode(response.body).list);
    });
    return courses;
  }

  Map<String, String> getSingleCourse(String id) {
    Map<String, String> course = {};
    http.get(
      Uri.parse('$endPoint/Courses/$id?Page=1&PageSize=2147483647'),
      headers: {'Authorization': 'Mazalax $token'},
    ).then((response) {
      course = json.decode(response.body);
    });
    return course;
  }

  Map<String, String> getSingleCourseTimeTable(String id) {
    Map<String, String> courseTimeTable = {};
    http.get(
      Uri.parse('$endPoint/Courses/$id/TimeTables?Page=1&PageSize=2147483647'),
      headers: {'Authorization': 'Mazalax $token'},
    ).then((response) {
      courseTimeTable = json.decode(response.body);
    });
    return courseTimeTable;
  }

  Map<String, String> getSingleCourseMasters(String id) {
    Map<String, String> courseMasters = {};
    http.get(
      Uri.parse('$endPoint/Courses/$id/Masters?Page=1&PageSize=2147483647'),
      headers: {'Authorization': 'Mazalax $token'},
    ).then((response) {
      courseMasters = json.decode(response.body);
    });
    return courseMasters;
  }

  Future<void> chooseCourse(String id) async {
    final response = await http.post(
      Uri.parse('$endPoint/Courses/$id/Choose'),
      headers: {'Authorization': 'Mazalax $token'},
    );
    if (response.statusCode == 200) {
      //TODO Done Snackbar and stuff
    } else {
      //Not Done!
    }
  }

//=============================Courses======================================

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
