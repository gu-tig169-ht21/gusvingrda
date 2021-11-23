/* // ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:my_first_app/task_list.dart';
import 'package:my_first_app/task_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterView extends StatefulWidget {
  const FilterView({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: Colors.white,
        actions: [],
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: _backgroundImage(),
        child: Column(children: [
          DropdownMenuItem(
            child: DropdownButton(
                items: [
                  DropdownMenuItem(
                      value: Alignment.bottomRight, child: Text('All')),
                  DropdownMenuItem(
                      value: Alignment.bottomLeft,
                      child: Text('Not completed')),
                  DropdownMenuItem(
                      value: Alignment.center, child: Text('Completed')),
                ],
                onChanged: (value) {
                  setState(() {});
                }),
          ),
        ]),
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
 */