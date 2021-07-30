import 'package:flutter/material.dart';
import 'package:webapi_flutter/database/dao/contato_dao.dart';
import 'package:webapi_flutter/models/contato.dart';

const String TITULO_FORMULARIO_NOVO_CONTATO = 'Novo Contato';

const String LABEL_NOME_CONTATO = 'Nome do contato';
const String LABEL_NUMERO_CONTA = 'Número da conta';

const String TITULO_BOTAO_CADASTRAR = 'Cadastrar';

const double TAMANHO_FONTE_INPUT = 24.0;
const double PADDING_PADRAO = 8.0;

class FormularioNovoContato extends StatefulWidget {
  @override
  _FormularioNovoContatoState createState() => _FormularioNovoContatoState();
}

class _FormularioNovoContatoState extends State<FormularioNovoContato> {

  final TextEditingController _controladorNomeContato = TextEditingController();
  final TextEditingController _controladorNumeroConta = TextEditingController();
  final ContatoDao _dao = ContatoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TITULO_FORMULARIO_NOVO_CONTATO),
      ),
      body: Padding(
        padding: const EdgeInsets.all(PADDING_PADRAO),
        child: Column(
          children: [
            TextField(
              controller: _controladorNomeContato,
              decoration: InputDecoration(
                labelText: LABEL_NOME_CONTATO,
              ),
              style: TextStyle(
                fontSize: TAMANHO_FONTE_INPUT
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: PADDING_PADRAO),
              child: TextField(
                controller: _controladorNumeroConta,
                decoration: InputDecoration(
                  labelText: LABEL_NUMERO_CONTA,
                ),
                style: TextStyle(
                  fontSize: TAMANHO_FONTE_INPUT
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: PADDING_PADRAO),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () => _criarContato(),
                  child: Text(TITULO_BOTAO_CADASTRAR),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _criarContato() {
    String nomeContato = _controladorNomeContato.text;
    int? numeroConta = int.tryParse(_controladorNumeroConta.text);

    if (nomeContato != '' && numeroConta != null) {
      final Contato contato = Contato(0, nomeContato, numeroConta);
      
      _dao.salvarContato(contato).then((value) => Navigator.pop(context));
    }
  }
}
