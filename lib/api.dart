// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'task_model.dart';

const API_KEY = '0ea541c9-1432-4d89-b9d9-d8df58498f87';
const API_URL = 'https://todoapp-api-pyq5q.ondigitalocean.app';

class Api {
  static Future<List<TaskItem>> addTask(TaskItem taskItem) async {
    Map<String, dynamic> json = TaskItem.toJson(taskItem);
    var bodyString = jsonEncode(json);
    var response = await http.post(
      Uri.parse('$API_URL/todos?key=$API_KEY'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<TaskItem>((data) {
      return TaskItem.fromJson(data);
    }).toList();
  }

  static Future deleteTask(String taskID) async {
    var response =
        await http.delete(Uri.parse('$API_URL/todos/$taskID?key=$API_KEY'));
    var bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<TaskItem>((data) {
      return TaskItem.fromJson(data);
    }).toList();
  }

  static Future updateTask(TaskItem taskItem) async {
    String taskID = taskItem.taskID;
    Map<String, dynamic> json = TaskItem.toJsonChecked(taskItem);
    var bodyString = jsonEncode(json);
    var response = await http.put(
      Uri.parse('$API_URL/todos/$taskID?key=$API_KEY'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );

    bodyString = response.body;
    var list = jsonDecode(bodyString);
    return list.map<TaskItem>((data) {
      return TaskItem.fromJson(data);
    }).toList();
  }

  static Future<List<TaskItem>> getTaskList() async {
    var response = await http.get(Uri.parse('$API_URL/todos?key=$API_KEY'));
    String bodyString = response.body;
    var json = jsonDecode(bodyString);

    return json.map<TaskItem>((data) {
      return TaskItem.fromJson(data);
    }).toList();
  }
}
