import 'package:bytebank/components/item_transferencia.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

import 'formulario_transferencia.dart';

const String CABECALHO_TELA = 'Transferências';

class ListaTransferenciasState extends State<ListaTransferencias> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CABECALHO_TELA),
      ),
      body: ListView.builder(
        itemBuilder: (context, posicao) {
          final Transferencia t = widget._listaTransferencias[posicao];
          return ItemTransferencia(t);
        },
        itemCount: widget._listaTransferencias.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia?> transferenciaRecebida = Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FormularioTransferencia())
          );

          // esse bloco será executado apenas quando
          // receber os dados do Widget `FormularioTransferencia`
          // que é enviado após chamarmos o `Navigator.push`
          transferenciaRecebida.then((t) {
            debugPrint('Chegou do widget FormularioTransferencia: $t');
            if (t != null)
              setState(() {
                widget._listaTransferencias.add(t);
              });
          });
        },
      ),
    );
  }

}

class ListaTransferencias extends StatefulWidget {

  final List<Transferencia> _listaTransferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}