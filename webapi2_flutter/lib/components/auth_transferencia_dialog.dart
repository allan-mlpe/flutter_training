import 'package:flutter/material.dart';

class AuthTransferenciaDialog extends StatefulWidget {

  final Function(String password) onConfirm;

  const AuthTransferenciaDialog({required this.onConfirm});

  @override
  _AuthTransferenciaDialogState createState() => _AuthTransferenciaDialogState();
}

class _AuthTransferenciaDialogState extends State<AuthTransferenciaDialog> {

  final TextEditingController _controladorCampoSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Autenticar transferência'),
      content: TextField(
        controller: _controladorCampoSenha,
        obscureText: true,
        maxLength: 4,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        style: TextStyle(
          fontSize: 64.0,
          letterSpacing: 24.0,
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => _fecharDialog(context),
            child: Text('Cancelar'),
        ),
        TextButton(
            onPressed: () {
              widget.onConfirm(_controladorCampoSenha.text);
              _fecharDialog(context);
            },
            child: Text('Confirmar'),
        )
      ],
    );
  }

  void _fecharDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
