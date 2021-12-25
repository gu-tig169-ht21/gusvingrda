// ignore_for_file: file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../models/background.dart';

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
    bool vis = true;
    String dltext = taskItem.deadline.toString();
    if (taskItem.deadline.isEmpty) {
      vis = false;
    } else if (dltext.compareTo(" ") == 0) {
      vis = false;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('View Task'),
        backgroundColor: Colors.white,
      ),
      body: BackgroundImage(
        Container(
          decoration: const BoxDecoration(color: Colors.white70),
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(height: 15),
              Text(taskItem.taskName, style: const TextStyle(fontSize: 30)),
              Container(height: 15),
              Visibility(
                visible: vis,
                child: const Text('Deadline:', style: TextStyle(fontSize: 20)),
              ),
              Container(height: 5),
              Visibility(
                visible: vis,
                child: Text(taskItem.deadline),
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
}
