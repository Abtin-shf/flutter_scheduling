import 'package:flutter/material.dart';

class AdminStudentsProvider with ChangeNotifier {
  List<Map<String, String>> _items = [
    {
      'name': 'Abtin Shafiei',
      'code': '985361065'
    },
    {
      'name': 'Haleh Jalali',
      'code': '985361012'
    }, {
      'name': 'Afra Khosroshahian',
      'code': '985361022'
    }, {
      'name': 'Amin Farzane',
      'code': '985367037'
    }, {
      'name': 'Mahdi Chavoshi',
      'code': '985367012'
    }, {
      'name': 'Tohid Yagmuri',
      'code': '985361035'
    }, {
      'name': 'Yashar Masruri',
      'code': '985361028'
    }, {
      'name': 'Fateme Esmati',
      'code': '985361043'
    }, {
      'name': 'Bita Khashechian',
      'code': '985361038'
    }, {
      'name': 'Abtin Shafiei',
      'code': '985361065'
    }, {
      'name': 'Abtin Shafiei',
      'code': '985361065'
    }, {
      'name': 'Abtin Shafiei',
      'code': '985361065'
    },

  ];

  List<Map<String, String>> get getItems {
    return [..._items];
  }

}