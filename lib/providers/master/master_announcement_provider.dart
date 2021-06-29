import 'package:flutter/material.dart';

class MasterAnnouncementProvider with ChangeNotifier {
  var _items = [
    {
      'id':'0',
      'title': 'To All Masters, Happy New Year!',
      'description':
      'we are gathered here today, to celebrate the new year together, may our days be better and better every day.',
      'dateTime': DateTime.now().toIso8601String(),
    },
    {
      'id':'1',
      'title': 'An Important Incident Report',
      'description':
      'Last Week, While Dan From HR tried to jump over the coworkers table, he got caught in the main server connections, later details will be announced shortly! stay tuned an pray for dans sanity!',
      'dateTime': DateTime.now().toIso8601String(),
    },
    {
      'id':'2',
      'title': 'The Servers Are Still Down!',
      'description':
      'Regarding The Last Incident That Took Place while Dan Was Drunk On Happiness, we are declaring that servers are still down!',
      'dateTime': DateTime.now().toIso8601String(),
    },
    {
      'id':'3',
      'title': 'Cheers! Dan is Back!',
      'description':
      'Dan Came Back From The Hospital And He is Going TO be Ok! But the doctors said there is little to nothing they can do about his sanity! We Still Love Him Though...',
      'dateTime': DateTime.now().toIso8601String(),
    },
    {
      'id':'4',
      'title': 'To All Masters, Happy New Year!',
      'description':
      'we are gathered here today, to celebrate the new year together, may our days be better and better every day.',
      'dateTime': DateTime.now().toIso8601String(),
    },
    {
      'id':'5',
      'title': 'An Important Incident Report',
      'description':
      'Last Week, While Dan From HR tried to jump over the coworkers table, he got caught in the main server connections, later details will be announced shortly! stay tuned an pray for dans sanity!',
      'dateTime': DateTime.now().toIso8601String(),
    },
    {
      'id':'6',
      'title': 'The Servers Are Still Down!',
      'description':
      'Regarding The Last Incident That Took Place while Dan Was Drunk On Happiness, we are declaring that servers are still down!',
      'dateTime': DateTime.now().toIso8601String(),
    },
    {
      'id':'7',
      'title': 'Cheers! Dan is Back!',
      'description':
      'Dan Came Back From The Hospital And He is Going TO be Ok! But the doctors said there is little to nothing they can do about his sanity! We Still Love Him Though...',
      'dateTime': DateTime.now().toIso8601String(),
    },
  ];

  List<Map<String, Object>> get getAnnouncements {
    return [..._items];
  }
}
