// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'api.dart';

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

  static Map<String, dynamic> toJson(TaskItem taskItem, String nyckel) {
    String info = taskItem.taskName;
    //print('Nuvarande nyckel=$nyckel, Min privata nyckel=$privateKey');
    if (nyckel.compareTo(privateKey) == 0) {
      info += '+' + taskItem.deadline + '+' + taskItem.description;
      print(info.toString());
    }
    return {
      'title': info,
      'done': taskItem.checked,
    };
  }

  static Map<String, dynamic> toJsonChecked(TaskItem taskItem, String nyckel) {
    String info = taskItem.taskName;

    if (nyckel.compareTo(privateKey) == 0) {
      info += '+' + taskItem.deadline + '+' + taskItem.description;
    }

    taskItem.checked = !taskItem.checked;

    return {
      'title': info,
      'done': taskItem.checked,
    };
  }

  /* static Map<String, dynamic> toJsonWithoutDetails(TaskItem taskItem) {
    String info = taskItem.taskName + taskItem.deadline + taskItem.description;

    return {
      'title': info,
      'done': taskItem.checked,
    };
  }

  static Map<String, dynamic> toJsonCheckedWithoutDetails(TaskItem taskItem) {
    String info = taskItem.taskName +
        '+' +
        taskItem.deadline +
        '+' +
        taskItem.description;

    taskItem.checked = !taskItem.checked;

    return {
      'title': info,
      'done': taskItem.checked,
    };
  } */

  static TaskItem fromJsonWithDetails(Map<String, dynamic> json) {
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

  static TaskItem fromJsonWithoutDetails(Map<String, dynamic> json) {
    return TaskItem(
      taskID: json['id'],
      taskName: json['title'],
      deadline: "",
      description: "",
      checked: json['done'],
    );
  }
}

class MyState extends ChangeNotifier {
  List<TaskItem> _list = [];
  String _filterBy = 'All';
  String _currentKey = 'private';

  String get filekey => _currentKey;
  String get filter => _filterBy;

  List<TaskItem> get list => _list;

  Future getList(nyckel) async {
    List<TaskItem> list = await Api.getTaskList(nyckel);
    _list = list;
    notifyListeners();
  }

  void addTask(TaskItem taskItem, String nyckel) async {
    _list = await Api.addTask(taskItem, nyckel);
    notifyListeners();
  }

  void removeTask(TaskItem taskItem, String nyckel) async {
    _list = await Api.deleteTask(taskItem.taskID, nyckel);
    print('removing task: this message is from task_model');
    notifyListeners();
  }

  void changeChecked(TaskItem taskItem, String nyckel) async {
    _list = await Api.updateTask(taskItem, nyckel);
    notifyListeners();
  }

  void setFilter(String filter) {
    _filterBy = filter;
    notifyListeners();
  }

  void changeKey(key) {
    _currentKey = key;
    notifyListeners();
  }
}
