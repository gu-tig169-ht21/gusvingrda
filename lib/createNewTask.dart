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
        constraints: const BoxConstraints.expand(),
        decoration: _backgroundImage(),
        padding:
            const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 80),
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(height: 15),
              const Text('Name of the task:', style: TextStyle(fontSize: 20)),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Handla',
                ),
              ),
              Container(height: 15),
              const Text('Deadline:', style: TextStyle(fontSize: 20)),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'yyyy-mm-dd ' + '(optional)',
                    hintStyle: TextStyle(fontStyle: FontStyle.italic)),
              ),
              Container(height: 15),
              const Text(
                'Description:',
                style: TextStyle(fontSize: 20),
              ),
              Container(height: 15),
              const TextField(
                maxLines: null,
                style: TextStyle(fontSize: 18, height: 3),
                decoration: InputDecoration(
                    hintText: 'Här kan du skriva inköpslista etc.',
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(fontStyle: FontStyle.italic)),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                  ),
                ),
                Container(
                  width: 50,
                  height: 80,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Save Task')),
              ])
            ],
          ),
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
