import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'package:webapi2_flutter/components/auth_transferencia_dialog.dart';
import 'package:webapi2_flutter/components/loading.dart';
import 'package:webapi2_flutter/components/mensagem_dialog.dart';
import 'package:webapi2_flutter/http/webclients/transferencia_webclient.dart';
import 'package:webapi2_flutter/models/contato.dart';
import 'package:webapi2_flutter/models/transferencia.dart';

class FormularioNovaTransferencia extends StatefulWidget {
  final Contato contato;

  FormularioNovaTransferencia(this.contato);

  @override
  _FormularioNovaTransferenciaState createState() =>
      _FormularioNovaTransferenciaState();
}

class _FormularioNovaTransferenciaState
    extends State<FormularioNovaTransferencia> {
  final TextEditingController _valueController = TextEditingController();
  final TransferenciaWebClient _client = TransferenciaWebClient();

  final String idTransferencia = Uuid().v4();

  bool carregando = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Transferência'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Visibility(
                child: Loading(),
                visible: carregando,
              ),
              Text(
                widget.contato.nome,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  widget.contato.numeroConta.toString(),
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _valueController,
                  style: TextStyle(fontSize: 24.0),
                  decoration: InputDecoration(labelText: 'Valor'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Visibility(
                    visible: !carregando,
                    child: ElevatedButton(
                      child: Text('Transferir'),
                      onPressed: () {
                        final double? valor =
                            double.tryParse(_valueController.text);

                        showDialog(
                            context: context,
                            builder: (contextDialog) {
                              return AuthTransferenciaDialog(
                                onConfirm: (String password) {
                                  if (valor != null) {
                                    final transferenciaCriada =
                                        Transferencia(idTransferencia, valor, widget.contato);

                                    _salvarTransferenciaENavegarParaLista(transferenciaCriada, password, context);
                                  }
                                },
                              );
                            });
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _salvarTransferenciaENavegarParaLista(
      Transferencia transferenciaCriada, String senha, BuildContext context) async {

    setState(() {
      carregando = true;
    });

    final Transferencia transferencia = await
      _client.salvarTransferencia(transferenciaCriada, senha)
        .catchError((e) {
          // se houver um erro, abre um dialog de erro
          _exibirDialogDeErro(context, message: e.message);
        }, test: (e) => e is ApiHttpException) // verifica se `e` é uma instância de ApiHttpException
        .catchError((e) {
          _exibirDialogDeErro(
            context, message: 'O servidor demorou muito a responder');
        }, test: (e) => e is TimeoutException)
        .catchError((e) {
          _exibirDialogDeErro(context);
        }, test: (e) => e is Exception)
        .whenComplete(() => setState(() {
          carregando = false;
        }));

    if (transferencia != null) {
      showDialog(context: context, builder: (dialogContext) {
        return SuccessDialog('Transferência realizada com sucesso!');
      }).then((value) => Navigator.pop(context));
    }
  }

  void _exibirDialogDeErro(BuildContext context,
      {String message = 'Erro desconhecido'}) {
    showDialog(context: context, builder: (contextDialog) {
      return FailureDialog(message);
    });
  }
}
