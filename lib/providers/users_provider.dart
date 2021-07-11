import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

class UsersProvider with ChangeNotifier {
  final token = LastWar.token;
  final endPoint = '${LastWar.dns}/Users';
  /*
  getUsers
  getStudents
  getSingleUser
  editUser
  deleteUser
  getUserProfileInformation
  editUserProfile
  changePassword
  addSingleUser
  addUsers
  */

  List<dynamic> getUsers(String? search) {
    List<dynamic> users = [];
    String query ='';
    if(search != null){
      query= 'search=$search&';
    }
    http.get(
      Uri.parse('$endPoint?$query''Page=1&PageSize=2147483647'),
      headers: {'Authorization': 'Mazalax $token'},
    ).then((response) {
      users = json
          .decode(response.body)
          .list;
    });
    return users;
  }
  List<Map<String,String>>get getStudents{
    final users = getUsers(null);
    List<Map<String,String>> students=[];
    users.forEach((user) {
      if(user['role'] == 'ROLE_STUDENT'){
        students.add(user);
      }
    });
    return students;
}

  Map<String, String> getSingleUser(String id) {
    Map<String, String> user = {};
    http.get(
      Uri.parse('$endPoint/$id'),
      headers: {'Authorization': 'Mazalax $token'},
    ).then((response) {
      user = json.decode(response.body);
    });
    return user;
  }

  Future<void> editUser(String id, String firstName, String lastName,
      String code) async {
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

  Map<String, String> get getUserProfileInformation {
    Map<String, String> userProfileInformation = {};
    http.get(
      Uri.parse('$endPoint/Profile'),
      headers: {'Authorization': 'Mazalax $token'},
    ).then((response) {
      userProfileInformation = json.decode(response.body);
    });
    return userProfileInformation;
  }

  Future<void> editUserProfile(String firstName, String lastName,
      String password) async {
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

  Future<void> changePassword(String currentPassword,
      String newPassword) async {
    final response = await http.post(
      Uri.parse('$endPoint/Profile/ChangePassword'),
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

  Future<void> addSingleUser(String firstName,
      String lastName,
      String password,
      String code,
      String role,) async {
    final response = await http.post(
      Uri.parse('$endPoint/Add'),
      body: json.encode({
        'firstName': firstName,
        'lastName': lastName,
        'password': password,
        'code': code,
        'role': role,
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
    final response = await http.post(Uri.parse('$endPoint/AddList'), body: json.encode(users),
      headers: {'Authorization': 'Mazalax $token'},);
    if (response.statusCode == 200 && json.decode(response.body)['id'] != 0) {
      //TODO Done Snackbar and stuff
    } else {
      //Not Done!
    }
  }


}
