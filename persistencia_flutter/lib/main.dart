import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900]
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bytebank'),
        ),
        body: Column(
          children: <Widget>[
            Image.asset('images/bytebank_logo.png'),
            Container(
              color: Colors.green,
              height: 120,
              width: 180,
              child: Column(
                children: <Widget>[
                  Icon(Icons.people),
                  Text('Contatos')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
