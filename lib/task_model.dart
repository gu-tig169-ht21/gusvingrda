// ignore_for_file: empty_constructor_bodies

import 'package:flutter/cupertino.dart';

class TaskItem {
  String taskName;
  String deadline;
  String description;
  bool checked = false;

  TaskItem(
      {required this.taskName,
      required this.deadline,
      required this.description,
      required this.checked});

  void taskCompleted(TaskItem taskItem) {
    checked = !checked;
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
