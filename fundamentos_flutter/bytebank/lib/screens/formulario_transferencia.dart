import 'package:bytebank/components/campo_formulario.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const String CABECALHO_TELA = 'Nova Transferência';

const String LABEL_NUMERO_CONTA = 'Número da conta';
const String HINT_NUMERO_CONTA = '0000';

const String LABEL_VALOR_TRANSFERENCIA = 'Valor da transferência';
const String HINT_VALOR_TRANSFERENCIA = '0.00';

const String TEXTO_BOTAO_CONFIRMAR = 'Confirmar';

class FormularioTransferenciaState extends State<FormularioTransferencia> {

  final _controladorCampoNumeroConta = TextEditingController();
  final _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(CABECALHO_TELA)
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CampoFormulario(
              controlador: _controladorCampoNumeroConta,
              label: LABEL_NUMERO_CONTA,
              hint: HINT_NUMERO_CONTA,
            ),
            CampoFormulario(
              controlador: _controladorCampoValor,
              label: LABEL_VALOR_TRANSFERENCIA,
              hint: HINT_VALOR_TRANSFERENCIA,
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
                child: Text(TEXTO_BOTAO_CONFIRMAR)
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