// ignore_for_file: file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'editTask.dart';
import 'task_model.dart';
import 'package:provider/provider.dart';

class ViewTask extends StatefulWidget {
  final taskItem;
  final String nyckel;

  ViewTask(this.taskItem, this.nyckel);

  @override
  State<ViewTask> createState() {
    return ViewTaskState(taskItem, nyckel);
  }
}

class ViewTaskState extends State<ViewTask> {
  final taskItem;
  final nyckel;

  ViewTaskState(this.taskItem, this.nyckel);

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
        actions: [
/*           TextButton(    HÄR ÄR ALLTSÅ KNPPEN TILL EDIT TASK (metoden som inte fungerar)
            child: const Text('Edit'),
            onPressed: () async {
              var newtaskItem = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditTask(
                    TaskItem(
                        taskID: "",
                        taskName: '',
                        deadline: '',
                        description: '',
                        checked: false),
                  ),
                ),
              );
              if (newtaskItem != null) {
                Provider.of<MyState>(context, listen: false)
                    .editTask(newtaskItem, nyckel);
              }
            },
          ), */
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

  _backgroundImage() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/background.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}
