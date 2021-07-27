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
          CampoFormulario(
            controlador: _controladorCampoNumeroConta,
            label: 'Número da conta',
            hint: '0000',
          ),
          CampoFormulario(
            controlador: _controladorCampoValor,
            label: 'Valor da transferência',
            hint: '0.00',
            icone: Icons.monetization_on,
            tipoTeclado: TextInputType.numberWithOptions(
              decimal: true
            ),
          ),
          ElevatedButton(
              onPressed: () => criarTransferencia(context),
              child: Text('Confirmar')
          )
        ],
      ),
    );
  }

  void criarTransferencia(BuildContext context) {
    debugPrint('Cliquei no botão');

    final double? valorTransferencia = double.tryParse(_controladorCampoValor.text);
    final int? contaDestino = int.tryParse(_controladorCampoNumeroConta.text);

    // debugPrint('Valor da transferência: ${valorTransferencia}');
    // debugPrint('Conta destino: ${_controladorCampoNumeroConta.text}');

    if (valorTransferencia != null && contaDestino != null) {
      final Transferencia transferencia = Transferencia(valorTransferencia, contaDestino);
      debugPrint(transferencia.toString());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(transferencia.toString()))
      );
    }
  }
}

class CampoFormulario extends StatelessWidget {

  final TextEditingController? controlador;
  final String? label;
  final String? hint;
  final TextInputType? tipoTeclado;
  final IconData? icone;

  CampoFormulario({this.controlador, this.label, this.hint, this.tipoTeclado, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
            fontSize: 24.0
        ),
        decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            icon: icone != null ? Icon(icone) : null,
        ),
        keyboardType: tipoTeclado != null ? tipoTeclado : TextInputType.number,
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