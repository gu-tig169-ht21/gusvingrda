// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'text_section.dart';
import 'CounterPlay.dart';
import 'ToDo.dart';

class numberGame extends StatefulWidget {
  const numberGame({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<numberGame> createState() => _numberGameState();
}

class _numberGameState extends State<numberGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: _backgroundImage(),
        child: Stack(children: [
          Container(height: 50, width: 400, color: Colors.white),
          _comingSoon(),
        ]),
      ),
    );
  }

  Widget _comingSoon() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: const Text(
        'NumberGame is coming soon!!',
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  _backgroundImage() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/numberGame.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}
