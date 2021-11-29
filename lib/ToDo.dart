// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:my_first_app/createNewTask.dart';
import 'package:my_first_app/task_list.dart';
import 'package:my_first_app/task_model.dart';
import 'createNewTask.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToDo extends StatefulWidget {
  const ToDo({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  bool allTasks = false;
  bool completedTasks = false;
  bool notComplededTasks = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: Colors.white,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              Provider.of<MyState>(context, listen: false)
                  .setFilter(value.toString());
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                  child: Text('All Tasks'),
                  textStyle: allTasks
                      ? TextStyle(color: Colors.blue, fontSize: 20)
                      : null,
                  value: 'All'),
              PopupMenuItem(
                  child: Text('Completed Tasks'),
                  textStyle: completedTasks
                      ? TextStyle(color: Colors.blue, fontSize: 20)
                      : null,
                  value: 'Completed'),
              PopupMenuItem(
                  child: Text('Not Completed Tasks'),
                  textStyle: notComplededTasks
                      ? TextStyle(color: Colors.blue, fontSize: 20)
                      : null,
                  value: 'Not Completed'),
            ],
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: Text('Filter'),
            ),
          )
        ],
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: _backgroundImage(),
        child: ListView(children: [
          Consumer<MyState>(
            builder: (context, state, child) => TaskList(
              _filterList(state.list, state.filter),
            ),
          ),
        ]),
      ),
      floatingActionButton: _actionButton(),
    );
  }
//---------------------------------------------------------------------------

  Widget _actionButton() {
    return (FloatingActionButton(
      onPressed: () async {
        var newtaskItem = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CreateNewTask(TaskItem(
                  taskID: "",
                  taskName: '',
                  deadline: '',
                  description: '',
                  checked: false))),
        );
        if (newtaskItem != null) {
          Provider.of<MyState>(context, listen: false).addTask(newtaskItem);
        }
      },
      child: const Icon(Icons.add, color: Colors.white, size: 30),
    ));
  }

  List<TaskItem> _filterList(list, filterBy) {
    if (filterBy == 'All') {
      allTasks = true;
      notComplededTasks = false;
      completedTasks = false;
      return list;
    }
    if (filterBy == 'Not Completed') {
      allTasks = false;
      notComplededTasks = true;
      completedTasks = false;
      return list.where((task) => task.checked == false).toList();
    }
    if (filterBy == 'Completed') {
      allTasks = false;
      notComplededTasks = false;
      completedTasks = true;
      return list.where((task) => task.checked == true).toList();
    }
    return list;
  }

  _backgroundImage() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/background.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}
