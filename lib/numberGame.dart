// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'api.dart';

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
        child: Column(children: [
          _comingSoon(),
          //_apiTester(),
        ]),
      ),
    );
  }

  Widget _comingSoon() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2.0),
          color: Colors.white),
      height: 50,
      width: 400,
      margin: const EdgeInsets.all(10),
      child: const Text(
        'NumberGame is coming soon!!',
        style: TextStyle(fontSize: 24),
      ),
    );
  }

/*   Widget _apiTester() {
    String api_key = "";
    return Container(
      child: ElevatedButton(
        child: const Text('Get API-key'),
        onPressed: () {
          _getKey();
          print(api_key);
        },
      ),
    );
  }

  static Future<String> _getKey() async {
    var API_URL = 'https://todoapp-api-pyq5q.ondigitalocean.app/register';
    var response = await http.get(Uri.parse(API_URL));
    var bodyString = response.body;
    print(bodyString);
    var api_key = jsonDecode(bodyString);
    print(api_key);
    return api_key.toString();
  } */

  _backgroundImage() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/numberGame.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}
