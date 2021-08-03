import 'package:flutter/material.dart';
import 'package:webapi2_flutter/components/auth_transferencia_dialog.dart';
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
                                      Transferencia(valor, widget.contato);

                                  _salvarTransferenciaENavegarParaLista(transferenciaCriada, password, context);
                                }
                              },
                            );
                          });
                    },
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
      Transferencia transferenciaCriada, String senha, BuildContext context) {
    _client.salvarTransferencia(transferenciaCriada, senha).then((transferencia) => {
          if (transferencia != null) {Navigator.pop(context)}
        });
  }
}
