import 'package:flutter/material.dart';

void main() => runApp(Bytebank());

class Bytebank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
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
              onPressed: () {
                final transferenciaCriada = _criarTransferencia(context);

                Navigator.pop(context, transferenciaCriada);
              },
              child: Text('Confirmar')
          )
        ],
      ),
    );
  }

  Transferencia? _criarTransferencia(BuildContext context) {
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

      return transferencia;
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

  final List<Transferencia> listaTransferencias = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListView.builder(
        itemBuilder: (context, posicao) {
          final Transferencia t = listaTransferencias[posicao];
          return ItemTransferencia(t);
        },
        itemCount: listaTransferencias.length,
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
            debugPrint('Chegouuuu: $t');
            if (t != null)
              listaTransferencias.add(t);
          });
        },
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