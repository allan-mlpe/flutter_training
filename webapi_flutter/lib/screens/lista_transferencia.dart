import 'package:flutter/material.dart';
import 'package:webapi_flutter/components/loading.dart';
import 'package:webapi_flutter/http/webclient.dart';
import 'package:webapi_flutter/models/contato.dart';
import 'package:webapi_flutter/models/transferencia.dart';

class ListaTransferencia extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: FutureBuilder<List<Transferencia>>(
        future: buscarTransferencias(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
              break;
            case ConnectionState.waiting:
              return Loading();
            case ConnectionState.done:
              final List<Transferencia> transferencias = snapshot.data;

              return ListView.builder(
                itemCount: transferencias.length,
                itemBuilder: (context, indice) {
                  final Transferencia transferencia = transferencias[indice];
                  return _ItemTransferencia(transferencia);
                },
              );
          }

          return Text('Erro desconhecido');
        },
      ),
    );
  }
}

class _ItemTransferencia extends StatelessWidget {

  final Transferencia transferencia;

  _ItemTransferencia(this.transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(
          '${transferencia.valor}',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '${transferencia.contato.numeroConta}',
          style: TextStyle(
            fontSize: 16.0
          ),
        ),
      ),
    );
  }
}
