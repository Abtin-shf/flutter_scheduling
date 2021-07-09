import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

class UsersProvider with ChangeNotifier {
  final token = LastWar.token;
  final endPoint = '${LastWar.dns}/Users';

  List<dynamic>  getUsers(String search) {
    final users = [];
    http.get(
      Uri.parse('$endPoint?search=$search&Page=1&PageSize=2147483647'),
      headers: {'Authorization': 'Mazalax $token'},
    ).then((response) {
      users.addAll(json.decode(response.body).list);
    });
    return users;
  }

  List<dynamic> getSingleUser(String id) {
    final user = [];
    http.get(
      Uri.parse('$endPoint/$id'),
      headers: {'Authorization': 'Mazalax $token'},
    ).then((response) {
      user.addAll(json.decode(response.body));
    });
    return user;
  }

  Future<void> editUser(
      String id, String firstName, String lastName, String code) async {
    final response = await http.put(
      Uri.parse('$endPoint/$id'),
      body: json.encode({
        'firstName': firstName,
        'lastName': lastName,
        'code': code,
      }),
      headers: {'Authorization': 'Mazalax $token'},
    );
    if (response.statusCode == 200 && json.decode(response.body)['id'] != 0) {
      //TODO Done Snackbar and stuff
    } else {
      //Not Done!
    }
  }

  void deleteUser(String id) {
    http.delete(
      Uri.parse('$endPoint/$id'),
      headers: {'Authorization': 'Mazalax $token'},
    );
  }

  List<dynamic> get getUserProfileInformation {
    final userProfileInformation = [];
    http.get(
      Uri.parse('$endPoint/Profile'),
      headers: {'Authorization': 'Mazalax $token'},
    ).then((response) {
      userProfileInformation.addAll(json.decode(response.body));
    });
    return userProfileInformation;
  }

  Future<void> editUserProfile(
      String firstName, String lastName, String password) async {
    final response = await http.post(
      Uri.parse('$endPoint/Profile'),
      body: json.encode({
        'firstName': firstName,
        'lastName': lastName,
        'password': password,
      }),
      headers: {'Authorization': 'Mazalax $token'},
    );
    if (response.statusCode == 200 && json.decode(response.body)['id'] != 0) {
      //TODO Done Snackbar and stuff
    } else {
      //Not Done!
    }
  }

  Future<void> changePassword(
      String currentPassword, String newPassword) async {
    final response = await http.post(
      Uri.parse('$endPoint/Profile'),
      body: json.encode({
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      }),
      headers: {'Authorization': 'Mazalax $token'},
    );
    if (response.statusCode == 200 && json.decode(response.body)['id'] != 0) {
      //TODO Done Snackbar and stuff
    } else {
      //Not Done!
    }
  }

  Future<void> addSingleUser(
    String firstName,
    String lastName,
    String password,
    String code,
    String rule,
  ) async {
    final response = await http.post(
      Uri.parse('$endPoint/Add'),
      body: json.encode({
        'firstName': firstName,
        'lastName': lastName,
        'password': password,
        'code': code,
        'rule': rule,
      }),
      headers: {'Authorization': 'Mazalax $token'},
    );
    if (response.statusCode == 200 && json.decode(response.body)['id'] != 0) {
      //TODO Done Snackbar and stuff
    } else {
      //Not Done!
    }
  }

  Future<void> addUsers(List users) async {
    users.forEach((user) async {
      final response = await http.post(
        Uri.parse('$endPoint/AddList'),
        body: json.encode([
          {
            'firstName': user['firstName'],
            'lastName': user['lastName'],
            'password': user['password'],
            'code': user['code'],
            'rule': user['rule'],
          }
        ]),
        headers: {'Authorization': 'Mazalax $token'},
      );
      if (response.statusCode == 200 && json.decode(response.body)['id'] != 0) {
        //TODO Done Snackbar and stuff
      } else {
        //Not Done!
      }
    });
  }
}
