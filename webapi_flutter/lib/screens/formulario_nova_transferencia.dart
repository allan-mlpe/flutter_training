import 'package:flutter/material.dart';
import 'package:webapi_flutter/http/webclient.dart';
import 'package:webapi_flutter/models/contato.dart';
import 'package:webapi_flutter/models/transferencia.dart';

class FormularioNovaTransferencia extends StatefulWidget {
  final Contato contato;

  FormularioNovaTransferencia(this.contato);

  @override
  _FormularioNovaTransferenciaState createState() => _FormularioNovaTransferenciaState();
}

class _FormularioNovaTransferenciaState extends State<FormularioNovaTransferencia> {
  final TextEditingController _valueController = TextEditingController();

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
                    child: Text('Transferir'), onPressed: () {
                    final double? valor =
                          double.tryParse(_valueController.text);

                      if (valor != null) {
                        final transferenciaCriada =
                            Transferencia(valor, widget.contato);

                        _salvarTransferenciaENavegarParaLista(transferenciaCriada, context);
                      }
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

  void _salvarTransferenciaENavegarParaLista(Transferencia transferenciaCriada, BuildContext context) {
    salvarTransferencia(transferenciaCriada)
        .then((transferencia) => {
              if (transferencia != null)
                {Navigator.pop(context)}
            });
  }
}
