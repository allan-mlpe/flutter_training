import 'package:flutter/material.dart';

void main() => runApp(Bytebank());

class Bytebank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {

  final _controladorCampoNumeroConta = TextEditingController();
  final _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Transferência')
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controladorCampoNumeroConta,
              style: TextStyle(
                fontSize: 24.0
              ),
              decoration: InputDecoration(
                labelText: 'Número da conta',
                hintText: '0000'
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controladorCampoValor,
              style: TextStyle(
                fontSize: 24.0
              ),
              decoration: InputDecoration(
                labelText: 'Valor da transferência',
                hintText: '0.00',
                icon: Icon(Icons.monetization_on)
              ),
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                debugPrint('Cliquei no botão');

                final double? valorTransferencia = double.tryParse(_controladorCampoValor.text);
                final int? contaDestino = int.tryParse(_controladorCampoNumeroConta.text);

                // debugPrint('Valor da transferência: ${valorTransferencia}');
                // debugPrint('Conta destino: ${_controladorCampoNumeroConta.text}');

                if (valorTransferencia != null && contaDestino != null) {
                  final Transferencia transferencia = Transferencia(valorTransferencia, contaDestino);
                  debugPrint(transferencia.toString());
                }
              },
              child: Text('Confirmar')
          )
        ],
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.0, 1000)),
          ItemTransferencia(Transferencia(197.9, 1000)),
          ItemTransferencia(Transferencia(1150, 1234)),
          ItemTransferencia(Transferencia(244, 1000)),
          ItemTransferencia(Transferencia(673.97, 23121)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}