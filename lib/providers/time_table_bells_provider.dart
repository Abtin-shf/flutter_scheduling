import 'package:flutter/material.dart';
import 'dart:convert';
import '../main.dart';
import 'package:http/http.dart' as http;

class TimeTableBellsProvider with ChangeNotifier {
  final token = LastWar.token;
  final endPoint = '${LastWar.dns}/TimeTableBells';

  List<dynamic> getTimeTableBells() {
    final timeTableBells = [];
    http.get(
      Uri.parse('$endPoint?Page=1&PageSize=2147483647'),
      headers: {'Authorization': 'Mazalax $token'},
    ).then((response) {
      timeTableBells.addAll(json.decode(response.body).list);
    });
    return timeTableBells;
  }

  Future<void> addTimeTableBells(
      String dayId, String bellId, String timeTableId) async {
    final response = await http.post(
      Uri.parse('$endPoint'),
      body: json.encode({
        'dayId': dayId,
        'bellId': bellId,
        'timeTableId': timeTableId,
      }),
      headers: {'Authorization': 'Mazalax $token'},
    );
    if (response.statusCode == 200) {
      //TODO Done Snackbar and stuff
    } else {
      //Not Done!
    }
  }

  List<dynamic> getSingleTimeTableBell(String id) {
    final timeTableBell = [];
    http.get(
      Uri.parse('$endPoint/$id'),
      headers: {'Authorization': 'Mazalax $token'},
    ).then((response) {
      timeTableBell.addAll(json.decode(response.body));
    });
    return timeTableBell;
  }

  void deleteTimeTableBell(String id) {
    http.delete(
      Uri.parse('$endPoint/$id'),
      headers: {'Authorization': 'Mazalax $token'},
    );
  }
}
