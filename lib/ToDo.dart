// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:my_first_app/createNewTask.dart';
import 'package:my_first_app/task_item.dart';
import 'package:my_first_app/task_list.dart';
import 'viewTask.dart';
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
  final TextEditingController _textFieldController = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: Colors.white,
        actions: [
          PopupMenuButton<MenuItem>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) =>
                [...MenuItems.itemsFirst.map(buildItem).toList()],
          ),
        ],
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: _backgroundImage(),
        child: ListView(
          children: [
            TaskList(
              [
                TaskItem(
                    taskName: 'Handla',
                    deadline: '2021-11-15',
                    description: 'Att handla: \n-potatis\n-kaffe\n-mjölk',
                    checked: isChecked),
                TaskItem(
                    taskName: 'Träna',
                    deadline: 'onsdag 18.00',
                    description: 'Träna med Linn @Nordic',
                    checked: isChecked),
                TaskItem(
                    taskName: 'Lär dig Flutter',
                    deadline: '2021-12-13',
                    description:
                        'Kan vara bra att lära dig då kursen går ut på det',
                    checked: isChecked),
              ],
            )
          ],
        ),
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
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CreateNewTask(
              title: 'Create New Task',
            ),
          ),
        );
    }
  }
//---------------------------------------------------------------------------

  Widget _actionButton() {
    var isPressed = false;
    return (FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CreateNewTask(title: 'Create New Task')),
        );
      },
      child: const Icon(Icons.add, color: Colors.white, size: 30),
    ));
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
