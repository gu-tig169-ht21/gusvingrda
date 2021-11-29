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
  String deadline = " ";
  String description = " ";
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
      deadline = _deadlinetextController.text;
      setState(() {});
    });
    _descriptiontextController.addListener(() {
      description = _descriptiontextController.text;
      setState(() {});
    });
  }

  bool inputEmpty = false;

  void makeTask() {
    /* String dl = deadline.toString();
    String ds = description.toString(); */
    Navigator.pop(
        context,
        TaskItem(
            taskID: "",
            taskName: taskName.toString(),
            deadline: deadline.toString(),
            description: description.toString(),
            checked: isChecked));
  }

  var borderColor = Colors.blue;
  var textColor = Colors.black;
  var taskNameText = 'Task Name';
  var taskNameHint = 'Vad ska du göra?';
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
            Text(taskNameText,
                style: TextStyle(fontSize: 20, color: textColor)),
            TextFormField(
              controller: _taskNametextController,
              decoration: InputDecoration(
                  hintText: taskNameHint,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: borderColor),
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
            Container(height: 15),
            const Text('Deadline:', style: TextStyle(fontSize: 20)),
            TextFormField(
              controller: _deadlinetextController,
              decoration: InputDecoration(
                  hintText: '(optional)',
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15)),
                  hintStyle: const TextStyle(fontStyle: FontStyle.italic)),
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
              decoration: InputDecoration(
                  hintText: 'Att handla: etc. (optional)',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintStyle: const TextStyle(fontStyle: FontStyle.italic)),
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
                      setState(() {
                        borderColor = Colors.red;
                        textColor = Colors.red;
                        taskNameHint = 'Enter a name of the task';
                      });
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
