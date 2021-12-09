// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'task_model.dart';

var privateKey =
    '0ea541c9-1432-4d89-b9d9-d8df58498f87'; //detta är min nyckel med detaljer

const API_URL = 'https://todoapp-api-pyq5q.ondigitalocean.app';

class Api {
  static Future<List<TaskItem>> addTask(
      TaskItem taskItem, String nyckel) async {
    Map<String, dynamic> json = TaskItem.toJson(taskItem, nyckel);
    var bodyString = jsonEncode(json);
    var response = await http.post(
      Uri.parse('$API_URL/todos?key=$nyckel'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    bodyString = response.body;
    var list = jsonDecode(bodyString);
    if (nyckel.compareTo(privateKey) == 0) {
      return list.map<TaskItem>((data) {
        return TaskItem.fromJsonWithDetails(data);
      }).toList();
    } else {
      return list.map<TaskItem>((data) {
        return TaskItem.fromJsonWithoutDetails(data);
      }).toList();
    }
  }

  static Future deleteTask(String taskID, String nyckel) async {
    var response =
        await http.delete(Uri.parse('$API_URL/todos/$taskID?key=$nyckel'));
    var bodyString = response.body;
    var list = jsonDecode(bodyString);
    if (nyckel.compareTo(privateKey) == 0) {
      return list.map<TaskItem>((data) {
        return TaskItem.fromJsonWithDetails(data);
      }).toList();
    } else {
      return list.map<TaskItem>((data) {
        return TaskItem.fromJsonWithoutDetails(data);
      }).toList();
    }
  }

  static Future updateTask(TaskItem taskItem, String nyckel) async {
    String taskID = taskItem.taskID;
    Map<String, dynamic> json = TaskItem.toJsonChecked(taskItem, nyckel);
    var bodyString = jsonEncode(json);
    var response = await http.put(
      Uri.parse('$API_URL/todos/$taskID?key=$nyckel'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );

    bodyString = response.body;
    var list = jsonDecode(bodyString);
    if (nyckel.compareTo(privateKey) == 0) {
      return list.map<TaskItem>((data) {
        return TaskItem.fromJsonWithDetails(data);
      }).toList();
    } else {
      return list.map<TaskItem>((data) {
        return TaskItem.fromJsonWithoutDetails(data);
      }).toList();
    }
  }

  static Future editTask(TaskItem taskItem, String nyckel) async {
    String taskID = taskItem.taskID;
    Map<String, dynamic> json = TaskItem.toJson(taskItem, nyckel);
    var bodyString = jsonEncode(json);
    var response = await http.put(
      Uri.parse('$API_URL/todos/$taskID?key=$nyckel'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );

    bodyString = response.body;
    var list = jsonDecode(bodyString);
    if (nyckel.compareTo(privateKey) == 0) {
      return list.map<TaskItem>((data) {
        return TaskItem.fromJsonWithDetails(data);
      }).toList();
    } else {
      return list.map<TaskItem>((data) {
        return TaskItem.fromJsonWithoutDetails(data);
      }).toList();
    }
  }

  static Future<List<TaskItem>> getTaskList(String nyckel) async {
    var response = await http.get(Uri.parse('$API_URL/todos?key=$nyckel'));
    String bodyString = response.body;
    var json = jsonDecode(bodyString);
    if (nyckel.compareTo(privateKey) == 0) {
      return json.map<TaskItem>((data) {
        return TaskItem.fromJsonWithDetails(data);
      }).toList();
    } else {
      return json.map<TaskItem>((data) {
        return TaskItem.fromJsonWithoutDetails(data);
      }).toList();
    }
  }
}
