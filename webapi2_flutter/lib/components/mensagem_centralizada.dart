import 'package:flutter/material.dart';

class MensagemCentralizada extends StatelessWidget {
  final String mensagem;
  final IconData? icone;
  final double tamanhoIcone;
  final double tamanhoFonte;

  MensagemCentralizada(
    this.mensagem, {
    this.icone,
    this.tamanhoIcone = 64,
    this.tamanhoFonte = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Visibility(
            child: Icon(
              icone,
              size: tamanhoIcone,
            ),
            visible: icone != null,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(
              mensagem,
              style: TextStyle(fontSize: tamanhoFonte),
            ),
          ),
        ],
      ),
    );
  }
}
