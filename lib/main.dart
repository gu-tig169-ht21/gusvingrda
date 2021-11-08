import 'package:flutter/material.dart';
import 'text_section.dart';
import 'CounterPlay.dart';
import 'ToDo.dart';
import 'numberGame.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter experiments',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const NewHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  Widget build(BuildContext context) {
    var isPressed = false;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: _backgroundImage(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buttonToDo(),
              _buttonCounterPlay(),
              _buttonNumberGame(),
            ],
          ),
        ));
  }

// ------- Below are the functions --------------
  Widget _buttonCounterPlay() {
    var isPressed = false;
    return (FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const CounterPlay(
                    title: 'CounterPlay',
                  )),
        );
      },
      label: const Text(
        'CounterPlay',
      ),
      icon: const Icon(Icons.add),
      backgroundColor: isPressed ? Colors.white : Colors.blue,
    ));
  }

  Widget _buttonToDo() {
    var isPressed = false;
    return (FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ToDo(
                    title: 'To-Do',
                  )),
        );
      },
      label: const Text(
        'To-Do',
      ),
      icon: const Icon(Icons.task_alt),
      backgroundColor: isPressed ? Colors.white : Colors.blue,
    ));
  }

  Widget _buttonNumberGame() {
    var isPressed = false;
    return (FloatingActionButton.extended(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const numberGame(
                    title: 'NumberGame',
                  )),
        );
      },
      label: const Text(
        'NumberGame',
      ),
      icon: const Icon(Icons.engineering),
      backgroundColor: isPressed ? Colors.white : Colors.white,
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
}
