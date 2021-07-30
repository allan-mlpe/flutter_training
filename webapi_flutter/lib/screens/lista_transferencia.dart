import 'package:flutter/material.dart';
import 'package:webapi_flutter/models/contato.dart';
import 'package:webapi_flutter/models/transferencia.dart';

class ListaTransferencia extends StatelessWidget {

  final List<Transferencia> transferencias = [
    Transferencia(1000, Contato(0, 'Allan', 1000)),
    Transferencia(1000, Contato(0, 'Allan', 1000)),
    Transferencia(1000, Contato(0, 'Allan', 1000)),
    Transferencia(1000, Contato(0, 'Allan', 1000)),
    Transferencia(1000, Contato(0, 'Allan', 1000)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: transferencias.length,
        itemBuilder: (context, indice) {
          final Transferencia transferencia = transferencias[indice];
          return _ItemTransferencia(transferencia);
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
