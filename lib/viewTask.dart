// ignore_for_file: file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class viewTask extends StatelessWidget {
  dynamic taskName;
  dynamic deadline;
  dynamic description;

  viewTask(this.taskName, this.deadline, this.description);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('View Task'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: _backgroundImage(),
        padding:
            const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 80),
        child: Container(
          decoration: const BoxDecoration(color: Colors.white70),
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(height: 15),
              Text(taskName, style: TextStyle(fontSize: 30)),
              Container(height: 15),
              const Text('Deadline:', style: TextStyle(fontSize: 20)),
              TextFormField(
                decoration: InputDecoration(
                    hintText: deadline,
                    hintStyle: TextStyle(fontStyle: FontStyle.italic)),
              ),
              Container(height: 15),
              Container(height: 15),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)),
                padding: EdgeInsets.all(5),
                child: Text(description, style: TextStyle(fontSize: 25)),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                  ),
                ),
                Container(
                  height: 150,
                ),
              ])
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
