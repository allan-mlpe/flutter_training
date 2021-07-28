import 'package:flutter/material.dart';

const String TITULO_FORMULARIO_NOVO_CONTATO = 'Novo Contato';

const String LABEL_NOME_CONTATO = 'Nome do contanto';
const String LABEL_NUMERO_CONTA = 'Número da conta';

const String TITULO_BOTAO_CADASTRAR = 'Cadastrar';

const double TAMANHO_FONTE_INPUT = 24.0;

class FormularioNovoContato extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TITULO_FORMULARIO_NOVO_CONTATO),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: LABEL_NOME_CONTATO,
              ),
              style: TextStyle(
                fontSize: TAMANHO_FONTE_INPUT
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
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
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(TITULO_BOTAO_CADASTRAR),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
