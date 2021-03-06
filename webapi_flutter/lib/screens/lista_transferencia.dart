import 'package:flutter/material.dart';
import 'package:webapi_flutter/components/loading.dart';
import 'package:webapi_flutter/components/mensagem_centralizada.dart';
import 'package:webapi_flutter/http/webclients/transferencia_webclient.dart';
import 'package:webapi_flutter/models/transferencia.dart';

class ListaTransferencia extends StatelessWidget {

  final TransferenciaWebClient _client = TransferenciaWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: FutureBuilder<List<Transferencia>>(
        future: _client.buscarTransferencias(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
              break;
            case ConnectionState.waiting:
              return Loading(textoLoading: 'Buscando transferências...',);
            case ConnectionState.done:
              if (snapshot.hasData) {
                final List<Transferencia> transferencias = snapshot.data;

                if (transferencias.isNotEmpty) {
                  return ListView.builder(
                    itemCount: transferencias.length,
                    itemBuilder: (context, indice) {
                      final Transferencia transferencia = transferencias[indice];
                      return _ItemTransferencia(transferencia);
                    },
                  );
                }
              }

              return MensagemCentralizada(
                'Nenhuma transação encontrada',
                icone: Icons.warning,
              );
          }

          return MensagemCentralizada('Erro desconhecido');
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
          '${transferencia.contato.numeroConta} - ${transferencia.contato.nome}',
          style: TextStyle(
            fontSize: 16.0
          ),
        ),
      ),
    );
  }
}
