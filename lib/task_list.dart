// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:my_first_app/task_item.dart';
import 'viewTask.dart';
import 'package:flutter/material.dart';

class MyState extends ChangeNotifier {
  bool _isChecked = false;

  void isChanged() {
    _isChecked = !_isChecked;
    notifyListeners();
  }

  bool get isChecked => _isChecked;
}

class TaskList extends StatelessWidget {
  final List<TaskItem> list;

  TaskList(this.list);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (Context, setState) => Column(
          children:
              list.map((taskItem) => _itemTask(taskItem, context)).toList()),
    );
  }

  Widget _itemTask(taskItem, context) {
    return StatefulBuilder(
      builder: (Context, setState) => Card(
        color: Colors.white,
        child: InkWell(
          splashColor: Colors.blue[80],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewTask(taskItem),
              ),
            );
          },
          child: ListTile(
              leading: Checkbox(
                  value: taskItem.checked,
                  onChanged: (bool? value) {
                    setState(() {
                      taskItem.checked = value;
                    });
                  }),
              title: Text(
                taskItem.taskName,
                style: _getTitleTextStyle(taskItem.checked),
              ),
              subtitle: Text(
                taskItem.deadline,
                style: _getSubtitleTextStyle(taskItem.checked),
              ),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.close))),
        ),
      ),
    );
  }

  _getTitleTextStyle(value) {
    if (value!) {
      return const TextStyle(
          fontSize: 26, decoration: TextDecoration.lineThrough);
    } else {
      return const TextStyle(
        fontSize: 26,
      );
    }
  }

  _getSubtitleTextStyle(value) {
    if (value!) {
      return const TextStyle(
          fontSize: 16, decoration: TextDecoration.lineThrough);
    } else {
      return const TextStyle(
        fontSize: 16,
      );
    }
  }
}
