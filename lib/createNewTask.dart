// ignore_for_file: file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'text_section.dart';
import 'CounterPlay.dart';
import 'ToDo.dart';
import 'numberGame.dart';
import 'menu_item.dart';
import 'menu_items.dart';

class createNewTask extends StatefulWidget {
  const createNewTask({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<createNewTask> createState() => _createNewTaskState();
}

class _createNewTaskState extends State<createNewTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: Colors.white,
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
                  Text('Here you are able to enter a new task: '),
                  TextField(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//---------------------------------------------------------------------------
  _backgroundImage() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/background.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}
