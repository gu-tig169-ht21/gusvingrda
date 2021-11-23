import 'dart:convert';
import 'package:http/http.dart' as http;
import 'task_model.dart';

const API_KEY = '';
const API_URL = 'https://todoapp-api-pyq5q.ondigitalocean.app/';

class api {
  static Future<List<TaskItem>> addTask(TaskItem taskItem) async {
    Map<String, dynamic> json = TaskItem.toJson(taskItem);
    var bodyString = jsonEncode(json);
    var response = await http.post(
      Uri.parse('$API_URL/julkort?key=$API_KEY'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<TaskItem>((data) {
      return TaskItem.fromJson(data);
    }).toList();
  }
}
