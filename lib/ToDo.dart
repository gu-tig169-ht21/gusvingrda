// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:my_first_app/createNewTask.dart';
import 'package:my_first_app/task_list.dart';
import 'package:my_first_app/task_model.dart';
import 'createNewTask.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/menu_items.dart';
import 'menu_item.dart';
import 'menu_items.dart';
import 'package:provider/provider.dart';

class ToDo extends StatefulWidget {
  const ToDo({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  bool isChecked = false;
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
                    PopupMenuItem(child: Text('All Tasks'), value: 'All'),
                    PopupMenuItem(
                        child: Text('Completed Tasks'), value: 'Completed'),
                    PopupMenuItem(
                        child: Text('Not Completed Tasks'),
                        value: 'Not Completed'),
                  ]),
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

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
        value: item,
        child: Row(
          children: [
            Icon(item.icon, color: Colors.black, size: 20),
            const SizedBox(width: 12),
            Text(item.text),
          ],
        ),
      );

  void onSelected(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.itemAdd:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateNewTask(
              TaskItem(
                  taskName: 'New Task',
                  deadline: 'optional',
                  description: 'description',
                  checked: false),
            ),
          ),
        );
        break;
    }
  }
//---------------------------------------------------------------------------

  Widget _actionButton() {
    return (FloatingActionButton(
      onPressed: () async {
        var newtaskItem = await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CreateNewTask(TaskItem(
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
    if (filterBy == 'All') return list;
    if (filterBy == 'Not Completed') {
      return list.where((task) => task.checked == false).toList();
    }
    if (filterBy == 'Completed') {
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
