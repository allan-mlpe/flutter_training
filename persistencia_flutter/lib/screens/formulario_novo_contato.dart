import 'package:flutter/material.dart';

const String TITULO_FORMULARIO_NOVO_CONTATO = 'Novo Contato';

class FormularioNovoContato extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TITULO_FORMULARIO_NOVO_CONTATO),
      ),
    );
  }
}
