import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:last_war/providers/time_table_bells_provider.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import '../main.dart';
import 'package:http/http.dart' as http;

class TimeTablesProvider with ChangeNotifier {
  final token = LastWar.token;
  final endPoint = '${LastWar.dns}/TimeTables';

//TODO
  List<dynamic> getTimeTables(String? studentId, String? masterId,
      String? courseId) {
    String query =
        '${studentId == null ? '' : 'StudentId=$studentId&'}${masterId == null
        ? ''
        : 'MasterId=$masterId&'}${courseId == null
        ? ''
        : 'CourseId=$courseId&'}';
    final timeTables = [];
    http.get(
      Uri.parse('$endPoint?$query' 'Page=1&PageSize=2147483647'),
      headers: {'Authorization': 'Mazalax $token'},
    ).then((response) {
      timeTables.addAll(json
          .decode(response.body)
          .list);
    });
    return timeTables;
  }

  List<String> getTimeTableBellIdsForAnSpecificDayAndTime(BuildContext context,
      String bellId, String dayId,) {
    List<String> specificTimeTablesBellsIds = [];
    getTimeTables(null, null, null).forEach((timeTable) {
      final Map<String, dynamic> timeTableBell = Provider.of<
          TimeTableBellsProvider>(context)
          .getSingleTimeTableBell(
          timeTable['timeTableBellId']);
      if (timeTableBell['day']['id'] == dayId &&
          timeTableBell['bell']['id'] == bellId) {
        specificTimeTablesBellsIds.add(timeTableBell['id']);
      }
    });
    return specificTimeTablesBellsIds;
  }

  List<dynamic> getTimeTablesForSpecificTimeTableBellIds(BuildContext context,
      String bellId, String dayId) {
    final List<Map<String, dynamic>> specificTimeTables = [];
    List<String> timeTableBellIds = getTimeTableBellIdsForAnSpecificDayAndTime(
        context, bellId, dayId);
    getTimeTables(null, null, null).forEach((timeTable) {
      if(timeTableBellIds.contains(timeTable['timeTableBellId'])){
        specificTimeTables.add(timeTable);
      }
    });
    return specificTimeTables;
  }


  Map<String, String> getSingleTimeTable(String id) {
    Map<String, String> timeTable = {};
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

// Not OPTIONAL
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
