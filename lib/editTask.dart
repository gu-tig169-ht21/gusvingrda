// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:my_first_app/task_item.dart';
import 'task_item.dart';
import 'package:provider/provider.dart';

class EditTask extends StatefulWidget {
  final taskItem;

  EditTask(this.taskItem);

  @override
  State<EditTask> createState() {
    return EditTaskState(taskItem);
  }
}

class EditTaskState extends State<EditTask> {
  final taskItem;

  EditTaskState(this.taskItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Edit Task')),
      backgroundColor: Colors.white,
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
                decoration: InputDecoration(
                  hintText: taskItem.taskName,
                ),
              ),
              Container(height: 15),
              const Text('Deadline:', style: TextStyle(fontSize: 20)),
              TextFormField(
                decoration: InputDecoration(
                    hintText: taskItem.deadline,
                    hintStyle: TextStyle(fontStyle: FontStyle.italic)),
              ),
              Container(height: 15),
              const Text(
                'Description:',
                style: TextStyle(fontSize: 20),
              ),
              Container(height: 15),
              TextField(
                maxLines: null,
                style: TextStyle(fontSize: 18, height: 3),
                decoration: InputDecoration(
                    hintText: taskItem.description,
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(fontStyle: FontStyle.italic)),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                  ),
                ),
                const SizedBox(
                  width: 50,
                  height: 80,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Save Task')),
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
