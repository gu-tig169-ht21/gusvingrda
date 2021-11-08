// ignore_for_file: file_names

import 'package:flutter/material.dart';
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
        // Here we take the value from the CounterPlay object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextSection(Colors.red, 'test_1'),
            TextSection(Colors.green, 'test_2'),
            TextSection(Colors.blue, 'test_3'),
          ],
        ),
      ),
    );
  }
}
