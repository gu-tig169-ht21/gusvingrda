import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'task_model.dart';
import 'ToDo.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'ToDo list, together',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const NewHomePage(title: 'ToDo list, together'),
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
  _NewHomePageState() {
    super.initState();
    sendIP();
  }
  String listkey = 'private';

  Future<void> _loadKey() async {
    var state = Provider.of<MyState>(context, listen: false);
    listkey = state.filekey;
    final _loadedKey = await rootBundle.loadString('assets/data/$listkey.txt');
    setState(() {
      listkey = _loadedKey;
    });
  }

  String titel = "private";
  String ipText = 'loading...';
  //String appbarChoice = "Private"; WORK_IN_PROGRESS(APPBAR)
  bool privateChoosen = true;
  bool sharedChoosen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 0,
        backgroundColor: Colors.white,
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          /* const Image(
            image: AssetImage('assets/images/guLogo.png'),
            height: 60,
            width: 55,
          ), */
          Column(
            children: [
              const Text(
                'ToDo, together',
                style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic),
              ),
              Text(
                'IP: $ipText',
                style: const TextStyle(fontSize: 12),
              )
            ],
          ),
        ]),
        actions: [
          TextButton(
            style: TextButton.styleFrom(primary: Colors.white),
            onPressed: () {
              setState(() {
                privateChoosen = !privateChoosen;
                sharedChoosen = !sharedChoosen;
                if (privateChoosen) {
                  Provider.of<MyState>(context, listen: false)
                      .changeKey('private');
                  titel = 'private';
                  _loadKey();
                } else if (sharedChoosen) {
                  Provider.of<MyState>(context, listen: false)
                      .changeKey('shared');
                  titel = 'shared';
                }
              });
            },
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: '    Private',
                    style: privateChoosen
                        ? const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 19)
                        : const TextStyle(color: Colors.black, fontSize: 18)),
                const TextSpan(
                    text: ' / ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                TextSpan(
                    text: 'Shared',
                    style: sharedChoosen
                        ? const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 19)
                        : const TextStyle(color: Colors.black, fontSize: 18)),
              ]

                  //EARLIER VERSION WITH A DROPDOWN MENU
                  /* PopupMenuButton( 
            onSelected: (value) {
              Provider.of<MyState>(context, listen: false).changeKey(value);
              titel = value.toString();
              _loadKey();
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                  child: Text('Private list'), value: 'private'),
              const PopupMenuItem(child: Text('Shared list'), value: 'shared'),
            ],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: Text(titel),
            ),
          ) */
                  ),
            ),
          )
        ],
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: _backgroundImage(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buttonToDo(),
            Container(
              padding: const EdgeInsets.all(6),
              height: 300,
              decoration: const BoxDecoration(color: Colors.white60),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Hello and Welcome to ',
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                    children: <TextSpan>[
                      const TextSpan(
                          text: '"ToDo, together!"',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const TextSpan(
                          text: '\nThis app is an app which contains two different ' +
                              'lists of tasks. \nOne list which is your private and one which is shared with your friends.' +
                              '\nIn the right corner of the Appbar, you can select wether to view your private ' +
                              'or your shared one. To see the list, just press the button above. \n\nCurrent selection is: '),
                      TextSpan(
                          text: '$titel.',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonToDo() {
    const Text("btn2");
    var isPressed = false;
    return (FloatingActionButton.extended(
      foregroundColor: Colors.black,
      elevation: 10,
      heroTag: "btn2",
      onPressed: () {
        _loadKey();
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ToDo(
                    title: 'To-Do: $titel',
                    nyckel: listkey,
                  )),
        );
      },
      label: const Text(
        'View To-Do list',
      ),
      icon: const Icon(Icons.task_alt),
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
