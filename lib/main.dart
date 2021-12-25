import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:todo_together/models/background.dart';
import 'models/task_model.dart';
import 'screens/todo_view.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//VAR GOD LÄS "README"

void main() {
  var state = MyState();

  runApp(ChangeNotifierProvider(create: (context) => state, child: MyApp()));
}

class MyApp extends StatelessWidget {
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
  const NewHomePage({required this.title});
  final String title;
  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  _NewHomePageState() {
    super.initState();
    sendIP();
  }

  Future<void> _changeKey() async {
    var state = Provider.of<MyState>(context, listen: false);
    listkey = state.filekey;
    print(state.filekey);
    final _loadedKey = await rootBundle.loadString('assets/data/$listkey.txt');
    print(_loadedKey);
    setState(() {
      apiKey = _loadedKey; //HÄR FÅR JAG API KEY
      Provider.of<MyState>(context, listen: false).setApiKey(apiKey);
    });
  }

  String listkey = 'private';
  String titel = "private";
  String ipText = 'loading...';
  late String apiKey;
  bool privateChoosen = true;
  bool sharedChoosen = false;
  bool showQR = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 0,
        backgroundColor: Colors.white,
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                  showQR = false;
                  _changeKey();
                } else if (sharedChoosen) {
                  Provider.of<MyState>(context, listen: false)
                      .changeKey('shared');
                  titel = 'shared';
                  showQR = true;
                  _changeKey();
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
                        : const TextStyle(color: Colors.black, fontSize: 19)),
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
                        : const TextStyle(color: Colors.black, fontSize: 19)),
              ]),
            ),
          )
        ],
      ),
      body: BackgroundImage(
        SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  height: 300,
                  decoration: const BoxDecoration(color: Colors.white70),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: 'Hello and Welcome to ',
                        style: const TextStyle(
                            fontSize: 22, color: Colors.black87),
                        children: <TextSpan>[
                          const TextSpan(
                              text: '"ToDo, together!"',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const TextSpan(
                              text: '\nThis app is an app which contains two different ' +
                                  'lists of tasks. \nOne list which is your private and one which is shared with your friends.' +
                                  '\nIn the right corner of the Appbar, you can select wether to view your private ' +
                                  'or your shared one. To see the list, just press the button below. \n\nCurrent selection is: '),
                          TextSpan(
                              text: '$titel.',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ]),
                  ),
                ),
                Container(
                  height: 15,
                ),
                _buttonToDo(),
                Visibility(
                  visible: showQR,
                  child: Column(children: [
                    Container(
                      height: 15,
                    ),
                    _qrploj(),
                    Container(
                      height: 15,
                    ),
                    const Text('Denna ruta innehar i dagsläget bara den nyckel till det ' +
                        'delade API:et.\nTanken är att en kompis i framtiden ska kunna' +
                        ' trycka "lägg till lista" i sin app och då kunna scanna denna.'),
                  ]),
                ),
              ]),
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
        _changeKey();
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ToDo(
                    title: 'To-Do: $titel',
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

  _qrploj() {
    return Column(children: [
      Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: const Text('Invite people to your shared list:',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
      ),
      QrImage(
        data: listkey,
        version: QrVersions.auto,
        size: 200,
        backgroundColor: Colors.white,
      ),
    ]);
  }
}
