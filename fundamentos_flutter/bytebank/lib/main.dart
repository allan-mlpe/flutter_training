import 'package:bytebank/screens/lista_transferencias.dart';
import 'package:flutter/material.dart';

void main() => runApp(Bytebank());

class Bytebank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(),
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.greenAccent[200],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[200],
          textTheme: ButtonTextTheme.accent,
        ),
      ),
      home: ListaTransferencias(),
    );
  }
}
