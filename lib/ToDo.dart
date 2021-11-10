// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:my_first_app/createNewTask.dart';
import 'createNewTask.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/menu_items.dart';
import 'menu_item.dart';
import 'menu_items.dart';
import 'text_section.dart';

class ToDo extends StatefulWidget {
  const ToDo({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
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
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  _TaskDone('Lär dig flutter', '2021-12-03'),
                  _TaskUnDone('Handla mat', '2021-11-09'),
                  _TaskDone('Tvätta', '2021-11-09'),
                  _TaskUnDone('Träna', 'TBD...'),
                  _TaskUnDone('osv...', 'xxxx-xx-xx'),
                  _TaskUnDone('osv...', 'xxxx-xx-xx'),
                  _TaskUnDone('osv...', 'xxxx-xx-xx'),
                  _TaskUnDone('osv...', 'xxxx-xx-xx'),
                  _TaskUnDone('osv...', 'xxxx-xx-xx'),
                  _TaskUnDone('osv...', 'xxxx-xx-xx'),
                  _TaskUnDone('osv...', 'xxxx-xx-xx'),
                ],
              ),
            ),
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
//---------------------------------------------------------------------------
  _backgroundImage() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/background.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _TaskDone(String namn, String deadline) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(50),
        onTap: () {
          print('Card tapped.');
        },
        child: ListTile(
            leading: _CrossedCheckBox(),
            title: Text(
              namn,
              style: TextStyle(
                  fontSize: 25, decoration: TextDecoration.lineThrough),
            ),
            subtitle: Text(
              'Deadline: $deadline',
              style: TextStyle(decoration: TextDecoration.lineThrough),
            ),
            trailing:
                IconButton(onPressed: () {}, icon: const Icon(Icons.close))
            //Icon(Icons.close),
            ),
      ),
    );
  }

  Widget _TaskUnDone(String namn, String deadline) {
    return Card(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(50),
        onTap: () {
          print('Card tapped.');
        },
        child: ListTile(
            leading: _UnCrossedCheckBox(),
            title: Text(namn, style: TextStyle(fontSize: 25)),
            subtitle: Text('Deadline: $deadline'),
            trailing:
                IconButton(onPressed: () {}, icon: const Icon(Icons.close))
            //Icon(Icons.close),
            ),
      ),
    );
  }

  _CrossedCheckBox() {
    return Checkbox(
      value: true,
      onChanged: (val) {},
      //shape: CircleBorder(),
    );
  }

  _UnCrossedCheckBox() {
    return Checkbox(
      value: false,
      onChanged: (val) {},
      //shape: CircleBorder(),
    );
  }

  void onSelected(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.itemAdd:
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => createNewTask(
                    title: 'Create New Task',
                  )),
        );
    }
  }

  Widget _actionButton() {
    var isPressed = false;
    return (FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => createNewTask(title: 'Create New Task')),
        );
      },
      child: const Icon(Icons.add),
    ));
  }

//---------------------- kanske klipper allt nedan:
  _task(
    String _taskName,
  ) {
    return Row(children: [
      Stack(children: [
        Container(
          height: 70,
          width: 401,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(50, 255, 255, 255),
                Color.fromARGB(255, 255, 255, 255)
              ],
            ),
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
          ),
        ),
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (val) {},
              shape: CircleBorder(),
              activeColor: Colors.white,
              hoverColor: Colors.white,
            ),
            Text(
              _taskName,
              style: TextStyle(fontSize: 25),
            ),
            Positioned(
              right: 20,
              child:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
            )
          ],
        )
      ])
    ]);
  }
}
