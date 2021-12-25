// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'dart:ui';
import '../models/task_model.dart';
import '../screens/task_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  final List<TaskItem> taskList;

  TaskList(this.taskList);

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<MyState>(context, listen: false);
    state.getList(context);
    return StatefulBuilder(
      builder: (Context, setState) => Column(
          children: taskList
              .map((taskItem) => _itemTask(taskItem, context))
              .toList()),
    );
  }

  Widget _itemTask(taskItem, context) {
    var state = Provider.of<MyState>(context, listen: false);
    return Card(
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
                onChanged: (value) {
                  {
                    state.changeChecked(taskItem, context);
                  }
                }),
            title: Text(
              taskItem.taskName,
              style: TextStyle(
                  fontSize: 24,
                  decoration:
                      taskItem.checked ? TextDecoration.lineThrough : null),
            ),
            subtitle: Text(
              taskItem.deadline,
              style: TextStyle(
                  decorationThickness: 2.0,
                  decoration:
                      taskItem.checked ? TextDecoration.lineThrough : null),
            ),
            trailing: IconButton(
                onPressed: () {
                  state.removeTask(taskItem, context);
                },
                icon: const Icon(Icons.close))),
      ),
    );
  }
}
