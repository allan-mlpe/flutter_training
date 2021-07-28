import 'package:flutter/material.dart';
import 'package:persistencia_flutter/screens/formulario_novo_contato.dart';

const String TITULO_LISTA_CONTATOS = 'Contatos';

class ListaContatos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TITULO_LISTA_CONTATOS),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text(
                'Jake',
                style: TextStyle(
                  fontSize: 24.0,
                )
              ),
              subtitle: Text('1000'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => FormularioNovoContato())
          ).then((contato) => debugPrint('Contato vindo do formulário: ${contato.toString()}'));
        },
      ),
    );
  }
}
