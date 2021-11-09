// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'text_section.dart';

class CounterPlay extends StatefulWidget {
  const CounterPlay({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<CounterPlay> createState() => _CounterPlayState();
}

class _CounterPlayState extends State<CounterPlay> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter > 49) {
        _counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: _backgroundImage(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'What happens when you reach 49?',
              style: TextStyle(fontSize: 26, color: Colors.white),
            ),
            Text(
              'Times pressed: $_counter',
              style: TextStyle(
                  color: getTheColor(_counter),
                  fontWeight: FontWeight.bold,
                  fontSize: _counter.toDouble()),
            ),
            if (_counter == 49) _buildPopupDialog(context),
            TextSection(Colors.blue.shade200,
                '''Här har jag bara lekt vidare med vår "start-template", bl.a. testat att låta värdet på "counter" sätta font-size och få texten att byta färg byberoende på ifall: '''),
            TextSection(Colors.yellow, 'Talet är ett primtal'),
            TextSection(Colors.green, 'Talet är jämnt'),
            TextSection(Colors.red, 'Talet är ojämnt'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(getIcon(_counter)),
        backgroundColor: Colors.green,
        focusColor: Colors.grey,
        elevation: 10,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
        title: const Text('DU NÅDDE 49!'),
        content: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.topCenter,
              child: Image.asset('assets/images/celebration.gif'),

              //Image.asset('assets/images/celebration.gif
            ),
          ],
        ));
  }

  _backgroundImage() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/background.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  //-----------------------------------------------
  Color getTheColor(int value) {
    Color evenOrNot = Colors.black; //if color = black, then something is wrong

    for (int i = 2; i < value; i++) {
      if (value % i != 0) {
        evenOrNot = Colors.yellow;
      } else if (value % 2 == 1) {
        evenOrNot = Colors.red;
        //if _counter is uneven, text color should be red
        return evenOrNot;
      } else if (value % 2 == 0) {
        evenOrNot = Colors.green;
        //if _counter is even, text color should be green
        return evenOrNot;
      }
    }

    return evenOrNot;
  }
//-------------- ^ First, checking if number is even or not ^

  getIcon(int counter) {
    var ic = Icons.add;
    if (counter == 49) {
      ic = Icons.restart_alt_sharp;
    }
    return ic;
  }
}
