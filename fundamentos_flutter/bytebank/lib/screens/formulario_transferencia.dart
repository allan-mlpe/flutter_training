import 'package:bytebank/components/campo_formulario.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class FormularioTransferenciaState extends State<FormularioTransferencia> {

  final _controladorCampoNumeroConta = TextEditingController();
  final _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Nova Transferência')
      ),
      body: SingleChildScrollView(
        child: Column(
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
      ),
    );
  }

  Transferencia? _criarTransferencia(BuildContext context) {
    debugPrint('Cliquei no botão');

    final double? valorTransferencia = double.tryParse(
        _controladorCampoValor.text);
    final int? contaDestino = int.tryParse(_controladorCampoNumeroConta.text);

    // debugPrint('Valor da transferência: ${valorTransferencia}');
    // debugPrint('Conta destino: ${_controladorCampoNumeroConta.text}');

    if (valorTransferencia != null && contaDestino != null) {
      final Transferencia transferencia = Transferencia(
          valorTransferencia, contaDestino);
      debugPrint(transferencia.toString());

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(transferencia.toString()))
      );

      return transferencia;
    }
  }
}

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}