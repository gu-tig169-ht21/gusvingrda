// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';

class TaskItem {
  String id;
  String taskName;
  String deadline;
  String description;
  bool checked = false;

  TaskItem(
      {required this.id,
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

  static TaskItem fromJson(Map<String, dynamic> json) {
    return TaskItem(
      id: json['id'],
      taskName: json['title'],
      deadline: json['title'],
      description: json['title'],
      checked: json['done'],
    );
  }
}

class MyState extends ChangeNotifier {
  final List<TaskItem> _list = [];
  String _filterBy = 'All';
  String get filter => _filterBy;
  List<TaskItem> get list => _list;

  void addTask(TaskItem taskItem) {
    _list.add(taskItem);
    notifyListeners();
  }

  void removeTask(TaskItem taskItem) {
    _list.remove(taskItem);
    notifyListeners();
  }

  void changeChecked(TaskItem taskItem) {
    taskItem.taskCompleted(taskItem);
    notifyListeners();
  }

  void setFilter(String filter) {
    this._filterBy = filter;
    notifyListeners();
  }
}
