// ignore_for_file: file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateNewTask extends StatefulWidget {
  const CreateNewTask({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<CreateNewTask> createState() {
    return CreateNewTaskState();
  }
}

class CreateNewTaskState extends State<CreateNewTask> {
  String TaskName = 'Task';
  String Deadline = 'xxxx-xx-xx';
  String Description = 'Location of the task etc.';
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
                    hintText: 'Location of the task etc.',
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
