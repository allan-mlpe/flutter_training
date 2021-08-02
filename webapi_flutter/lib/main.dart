import 'package:flutter/material.dart';
import 'package:webapi_flutter/http/webclient.dart';
import 'package:webapi_flutter/screens/dashboard.dart';

void main() {
  runApp(BytebankApp());
  buscarTudo();
}

class BytebankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
