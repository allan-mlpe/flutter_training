import 'package:flutter/material.dart';

class CampoFormulario extends StatelessWidget {

  final TextEditingController? controlador;
  final String? label;
  final String? hint;
  final TextInputType? tipoTeclado;
  final IconData? icone;

  CampoFormulario({this.controlador, this.label, this.hint, this.tipoTeclado, this.icone});

  /*
    Em um widget Stateless o método build é executado sempre que
    o widget aparece (após transições de tela, botão voltar, etc).
   */
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