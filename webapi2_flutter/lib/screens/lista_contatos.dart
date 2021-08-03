import 'package:flutter/material.dart';
import 'package:webapi2_flutter/components/loading.dart';
import 'package:webapi2_flutter/database/dao/contato_dao.dart';
import 'package:webapi2_flutter/models/contato.dart';
import 'package:webapi2_flutter/screens/formulario_nova_transferencia.dart';
import 'package:webapi2_flutter/screens/formulario_novo_contato.dart';

const String TITULO_LISTA_CONTATOS = 'Contatos';

class ListaContatos extends StatefulWidget {

  @override
  _ListaContatosState createState() => _ListaContatosState();
}

class _ListaContatosState extends State<ListaContatos> {

  final ContatoDao _dao = ContatoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TITULO_LISTA_CONTATOS),
      ),
      body: FutureBuilder<List<Contato>>(
        initialData: [],
        future: _dao.buscarContatos(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {

          Widget widget = Text('Erro desconhecido.');

          switch(snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              widget = Loading();
              break;
            case ConnectionState.done:
              final List<Contato> listaContatos = snapshot.data;
              widget = ListView.builder(
                itemBuilder: (context, index) {
                  final Contato contato = listaContatos[index];
                  return _CardContato(
                    contato,
                    onClick: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            FormularioNovaTransferencia(contato))),
                  );
                },
                itemCount: listaContatos.length,
              );
              break;
          }
          return widget;
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => FormularioNovoContato())
          ).then((value) => setState( () {}));
        },
      ),
    );
  }
}

class _CardContato extends StatelessWidget {
  final Contato contato;
  final Function onClick;

  const _CardContato(this.contato, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
            contato.nome,
            style: TextStyle(
              fontSize: 24.0,
            )
        ),
        subtitle: Text(contato.numeroConta.toString()),
        onTap: () => onClick(),
      ),
    );
  }
}
