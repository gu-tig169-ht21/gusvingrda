/* // ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, no_logic_in_create_state

FÖRSÖK TILL ATT GÖRA EN VY MED FUNKIONALITET TILL ATT EDIT:A EN TASK, DET HAR GÅTT HELT ÅT SKOGEN...

import 'package:flutter/material.dart';
import 'task_model.dart';

class EditTask extends StatefulWidget {
  final taskItem;

  const EditTask(this.taskItem, {Key? key}) : super(key: key);

  @override
  State<EditTask> createState() {
    return _EditTaskState(this.taskItem);
  }
}

class _EditTaskState extends State<EditTask> {
  final taskitem;

  TextEditingController _taskNametextController = TextEditingController();
  TextEditingController _deadlinetextController = TextEditingController();
  TextEditingController _descriptiontextController = TextEditingController();
  _EditTaskState(this.taskitem) {
    String taskName = taskItem.taskName;
    String deadline = taskItem.deadline;
    String description = taskItem.description;
    bool checked = taskItem.checked;

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
  void editTask() {
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
        title: const Text('Edit Task'),
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
                controller: _taskNametextController,
                decoration: InputDecoration(
                  hintText: taskName,
                ),
              ),
              Container(height: 15),
              const Text('Deadline:', style: TextStyle(fontSize: 20)),
              TextFormField(
                controller: _deadlinetextController,
                decoration: InputDecoration(
                    hintText: deadline,
                    hintStyle: TextStyle(fontStyle: FontStyle.italic)),
              ),
              Container(height: 15),
              const Text(
                'Description:',
                style: TextStyle(fontSize: 20),
              ),
              Container(height: 15),
              TextField(
                controller: _descriptiontextController,
                maxLines: null,
                style: TextStyle(fontSize: 18, height: 3),
                decoration: InputDecoration(
                    hintText: description,
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
                          setState(() {
                            borderColor = Colors.red;
                            textColor = Colors.red;
                            taskNameHint = 'Enter a name of the task';
                          });
                        } else {
                          editTask();
                          // pop:en sker efter en lyckad körning av "makeTask": Navigator.pop(context);
                        }
                      })
                ],
              )
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
 */