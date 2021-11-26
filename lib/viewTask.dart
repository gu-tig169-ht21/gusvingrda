// ignore_for_file: file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_first_app/task_model.dart';
import 'background.dart';
import 'editTask.dart';
import 'package:provider/provider.dart';

class ViewTask extends StatefulWidget {
  final taskItem;

  ViewTask(this.taskItem);

  @override
  State<ViewTask> createState() {
    return ViewTaskState(taskItem);
  }
}

class ViewTaskState extends State<ViewTask> {
  final taskItem;

  ViewTaskState(this.taskItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('View Task'),
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            child: const Text('Edit'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditTask(taskItem)));
            },
          ),
        ],
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: _backgroundImage(),
        padding:
            const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
        child: Container(
          decoration: const BoxDecoration(color: Colors.white70),
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(height: 15),
              Text(taskItem.taskName, style: const TextStyle(fontSize: 30)),
              Container(height: 15),
              const Text('Deadline:', style: TextStyle(fontSize: 20)),
              TextFormField(
                decoration: InputDecoration(
                    hintText: taskItem.deadline,
                    hintStyle: const TextStyle(fontStyle: FontStyle.italic)),
              ),
              Container(height: 15),
              Container(height: 15),
              Container(
                decoration: const BoxDecoration(color: Colors.transparent),
                padding: const EdgeInsets.all(5),
                child: Text(taskItem.description,
                    style: const TextStyle(fontSize: 25)),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                  ),
                ),
                Container(
                  height: 150,
                ),
              ]),
            ],
          ),
        ),
      ),
    );
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
