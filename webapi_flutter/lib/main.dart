import 'package:flutter/material.dart';
import 'package:webapi_flutter/http/webclient.dart';
import 'package:webapi_flutter/models/transferencia.dart';
import 'package:webapi_flutter/screens/dashboard.dart';

import 'models/contato.dart';

void main() {
  runApp(BytebankApp());
  salvarTransferencia(Transferencia(2000, Contato(0, 'Allan', 1000)));
  //buscarTransferencias();
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
