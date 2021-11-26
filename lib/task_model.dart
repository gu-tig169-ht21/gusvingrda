// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'api.dart';
import 'main.dart';

class TaskItem {
  String taskID;
  String taskName;
  String deadline;
  String description;
  bool checked = false;

  TaskItem(
      {required this.taskID,
      required this.taskName,
      required this.deadline,
      required this.description,
      required this.checked});

  void taskCompleted(TaskItem taskItem) {
    checked = !checked;
  }

  static Map<String, dynamic> toJson(TaskItem taskItem) {
    String info = taskItem.taskName +
        '+' +
        taskItem.deadline +
        '+' +
        taskItem.description;
    print(info);

    return {
      'title': info,
      'done': taskItem.checked,
    };
  }

  static Map<String, dynamic> toJsonChecked(TaskItem taskItem) {
    String info = taskItem.taskName +
        '+' +
        taskItem.deadline +
        '+' +
        taskItem.description;
    print(info);

    taskItem.checked = !taskItem.checked;

    return {
      'title': info,
      'done': taskItem.checked,
    };
  }

  static TaskItem fromJson(Map<String, dynamic> json) {
    String info = json['title'];
    String taskName = info.substring(0, info.indexOf('+'));
    String deadline =
        info.substring(info.indexOf('+') + 1, info.lastIndexOf('+'));
    String description = info.substring(info.lastIndexOf('+') + 1, info.length);

    return TaskItem(
      taskID: json['id'],
      taskName: taskName,
      deadline: deadline,
      description: description,
      checked: json['done'],
    );
  }
}

class MyState extends ChangeNotifier {
  List<TaskItem> _list = [];
  String _filterBy = 'All';

  String get filter => _filterBy;

  List<TaskItem> get list => _list;

  Future getList() async {
    List<TaskItem> list = await Api.getTaskList();
    _list = list;
    notifyListeners();
  }

  void addTask(TaskItem taskItem) async {
    _list = await Api.addTask(taskItem);
    notifyListeners();
  }

  void removeTask(TaskItem taskItem) async {
    _list = await Api.deleteTask(taskItem.taskID);
    print('removing task: this message is from task_model');
    notifyListeners();
  }

  void changeChecked(TaskItem taskItem) async {
    _list = await Api.updateTask(taskItem);
    notifyListeners();
  }

  void setFilter(String filter) {
    _filterBy = filter;
    notifyListeners();
  }
}
