import 'package:flutter/material.dart';
import 'package:my_first_app/task_model.dart';
import 'CounterPlay.dart';
import 'ToDo.dart';
import 'numberGame.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  var state = MyState();

  runApp(
      ChangeNotifierProvider(create: (context) => state, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter playArea',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: NewHomePage(title: 'Flutter Play Area Home Page'),
    );
  }
}

class NewHomePage extends StatefulWidget {
  NewHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  _NewHomePageState() {
    super.initState();
    sendIP();
  }

  String ipText = 'loading...';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Column(children: [
          const Text(
            'Flutter Play Area',
            style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
          ),
          Text(
            'IP: $ipText',
            style: const TextStyle(fontSize: 12),
          )
        ]),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: _backgroundImage(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buttonToDo(),
            _buttonCounterPlay(),
            _buttonNumberGame(),
          ],
        ),
      ),
    );
  }

  // ------- Below are the functions --------------
  Widget _buttonCounterPlay() {
    var isPressed = false;
    return (FloatingActionButton.extended(
      heroTag: "btn1",
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
      backgroundColor: isPressed ? Colors.white : Colors.white,
    ));
  }

  Widget _buttonToDo() {
    const Text("btn2");
    var isPressed = false;
    return (FloatingActionButton.extended(
      heroTag: "btn2",
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
      backgroundColor: isPressed ? Colors.white : Colors.white,
    ));
  }

  Widget _buttonNumberGame() {
    var isPressed = false;
    return (FloatingActionButton.extended(
      heroTag: "btn3",
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

  void sendIP() async {
    var result = await _fetchIP();
    setState(() {
      ipText = result;
    });
  }

  Future<String> _fetchIP() async {
    http.Response response = await http.get(Uri.parse('https://api.myip.com'));
    var jsonData = response.body;
    var ip = jsonDecode(jsonData);
    return ip['ip'].toString();
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
