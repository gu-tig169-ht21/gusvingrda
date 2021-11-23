// ignore_for_file: file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_first_app/task_model.dart';

class CreateNewTask extends StatefulWidget {
  final TaskItem taskItem;

  const CreateNewTask(this.taskItem, {Key? key}) : super(key: key);

  @override
  State<CreateNewTask> createState() {
    return _CreateNewTaskState(taskItem);
  }
}

class _CreateNewTaskState extends State<CreateNewTask> {
  String? taskName;
  String? deadline;
  String? description;
  bool isChecked = false;

  TextEditingController _taskNametextController = TextEditingController();
  TextEditingController _deadlinetextController = TextEditingController();
  TextEditingController _descriptiontextController = TextEditingController();

  _CreateNewTaskState(TaskItem taskItem) {
    taskName;
    deadline;
    description;
    isChecked;

    _taskNametextController = TextEditingController(text: taskItem.taskName);
    _deadlinetextController = TextEditingController(text: taskItem.deadline);
    _descriptiontextController =
        TextEditingController(text: taskItem.description);

    _taskNametextController.addListener(() {
      setState(() {
        taskName = _taskNametextController.text;
      });
    });
    _deadlinetextController.addListener(() {
      setState(() {
        deadline = _deadlinetextController.text;
      });
    });
    _descriptiontextController.addListener(() {
      setState(() {
        description = _descriptiontextController.text;
      });
    });
  }

  bool inputEmpty = false;

  void makeTask() {
    Navigator.pop(
        context,
        TaskItem(
            taskName: taskName.toString(),
            deadline: deadline.toString(),
            description: description.toString(),
            checked: isChecked));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Create New Task'),
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
          child: ListView(children: [
            Container(height: 15),
            const Text('Task Name', style: TextStyle(fontSize: 20)),
            TextFormField(
              controller: _taskNametextController,
              decoration: const InputDecoration(
                hintText: 'Handla',
              ),
            ),
            Container(height: 15),
            const Text('Deadline:', style: TextStyle(fontSize: 20)),
            TextFormField(
              controller: _deadlinetextController,
              decoration: const InputDecoration(
                  hintText: '(optional)',
                  hintStyle: TextStyle(fontStyle: FontStyle.italic)),
            ),
            Container(height: 15),
            const Text(
              'Description',
              style: TextStyle(fontSize: 20),
            ),
            Container(height: 15),
            TextField(
              controller: _descriptiontextController,
              maxLines: null,
              style: const TextStyle(fontSize: 18, height: 3),
              decoration: const InputDecoration(
                  hintText: 'Att handla: etc.',
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(fontStyle: FontStyle.italic)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  child: const Text(
                    'Save Task',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (_taskNametextController.text.isEmpty) {
                    } else {
                      makeTask();
                      // pop:en sker efter en lyckad körning av "makeTask": Navigator.pop(context);
                    }
                  },
                ),
              ],
            )
          ]),
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
