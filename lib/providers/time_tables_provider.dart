import 'package:flutter/material.dart';
import 'dart:convert';
import '../main.dart';
import 'package:http/http.dart' as http;

class TimeTablesProvider with ChangeNotifier {
  final token = LastWar.token;
  final endPoint = '${LastWar.dns}/TimeTables';

  List<dynamic> getTimeTables(
      String studentId, String masterId, String courseId) {
    final timeTables = [];
    http.get(
      Uri.parse(
          '$endPoint?StudentId=$studentId&MasterId=$masterId&CourseId=$courseId&Page=1&PageSize=2147483647'),
      headers: {'Authorization': 'Mazalax $token'},
    ).then((response) {
      timeTables.addAll(json.decode(response.body).list);
    });
    return timeTables;
  }

  List<dynamic> getSingleTimeTable(String id) {
    final timeTable = [];
    http.get(
      Uri.parse('$endPoint/$id'),
      headers: {'Authorization': 'Mazalax $token'},
    ).then((response) {
      timeTable.addAll(json.decode(response.body));
    });
    return timeTable;
  }

  Future<void> chooseTimeTable(String id) async {
    final response = await http.post(
      Uri.parse('$endPoint/$id/Choose'),
      headers: {'Authorization': 'Mazalax $token'},
    );
    if (response.statusCode == 200) {
      //TODO Done Snackbar and stuff
    } else {
      //Not Done!
    }
  }

  Future<void> startProcess(String maxClassPerBell) async {
    final response = await http.post(
      Uri.parse('$endPoint/StartProcess?maxClassPerBell=$maxClassPerBell'),
      headers: {'Authorization': 'Mazalax $token'},
    );
    if (response.statusCode == 200) {
      //TODO Done Snackbar and stuff
    } else {
      //Not Done!
    }
  }
}
