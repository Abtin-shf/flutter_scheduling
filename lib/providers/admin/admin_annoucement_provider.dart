import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../../main.dart';

class AdminAnnouncementProvider with ChangeNotifier {
  final endpoint = '${LastWar.dns}/Announcements';
  var token = LastWar.token;

  // List _items = [
  //   {
  //     'id': '0',
  //     'title': 'To All Masters, Happy New Year!',
  //     'description':
  //         'we are gathered here today, to celebrate the new year together, may our days be better and better every day.',
  //     'dateTime': DateTime.now().toIso8601String(),
  //   },
  //   {
  //     'id': '1',
  //     'title': 'An Important Incident Report',
  //     'description':
  //         'Last Week, While Dan From HR tried to jump over the coworkers table, he got caught in the main server connections, later details will be announced shortly! stay tuned an pray for dans sanity!',
  //     'dateTime': DateTime.now().toIso8601String(),
  //   },
  //   {
  //     'id': '2',
  //     'title': 'The Servers Are Still Down!',
  //     'description':
  //         'Regarding The Last Incident That Took Place while Dan Was Drunk On Happiness, we are declaring that servers are still down!',
  //     'dateTime': DateTime.now().toIso8601String(),
  //   },
  //   {
  //     'id': '3',
  //     'title': 'Cheers! Dan is Back!',
  //     'description':
  //         'Dan Came Back From The Hospital And He is Going TO be Ok! But the doctors said there is little to nothing they can do about his sanity! We Still Love Him Though...',
  //     'dateTime': DateTime.now().toIso8601String(),
  //   },
  //   {
  //     'id': '4',
  //     'title': 'To All Masters, Happy New Year!',
  //     'description':
  //         'we are gathered here today, to celebrate the new year together, may our days be better and better every day.',
  //     'dateTime': DateTime.now().toIso8601String(),
  //   },
  //   {
  //     'id': '5',
  //     'title': 'An Important Incident Report',
  //     'description':
  //         'Last Week, While Dan From HR tried to jump over the coworkers table, he got caught in the main server connections, later details will be announced shortly! stay tuned an pray for dans sanity!',
  //     'dateTime': DateTime.now().toIso8601String(),
  //   },
  //   {
  //     'id': '6',
  //     'title': 'The Servers Are Still Down!',
  //     'description':
  //         'Regarding The Last Incident That Took Place while Dan Was Drunk On Happiness, we are declaring that servers are still down!',
  //     'dateTime': DateTime.now().toIso8601String(),
  //   },
  //   {
  //     'id': '7',
  //     'title': 'Cheers! Dan is Back!',
  //     'description':
  //         'Dan Came Back From The Hospital And He is Going TO be Ok! But the doctors said there is little to nothing they can do about his sanity! We Still Love Him Though...',
  //     'dateTime': DateTime.now().toIso8601String(),
  //   },
  // ];

  List<Map<String, dynamic>> getAnnouncements(
      String? masterId, String? timeTableId) {
    List<Map<String, dynamic>> announcements = [];
    String query =
        '${masterId == null ? '' : 'MasterId=$masterId&'}${timeTableId == null ? '' : 'TimeTableId=$timeTableId&'}';
    http.get(Uri.parse('$endpoint?$query' 'Page=1&PageSize=2147483647'),
        headers: {'Authorization': 'Mazalax $token'}).then((response) {
      announcements = json.decode(response.body).list;
    });
    return announcements;
  }

  Future<void> addAnnouncement(String title, String description,
      String dateTime, String timeTableId) async {
    final response = await http.post(Uri.parse(endpoint),
        body: json.encode({
          'timeTableId': timeTableId,
          'description': description,
          'title': title,
          'dateTime': dateTime,
        }),
        headers: {'Authorization': 'Mazalax $token'});
    var announcement = json.decode(response.body);
    if (response.statusCode == 200 && announcement['id'] != 0) {
      //TODO SNACKBAR Done ,  and status code
    }
  }

  Future<void> deleteSingleAnnouncement(String id) async {
    await http.delete(
      Uri.parse('$endpoint/$id'),
      headers: {'Authorization': 'Mazalax $token'},
    );
  }

  void deleteListOfAnnouncements(List<String> deletingAnnouncementsIds) {
    deletingAnnouncementsIds.forEach((id) {
      deleteSingleAnnouncement(id);
    });
  }
}
