import 'package:flutter/material.dart';

class AuthTransferenciaDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Autenticar transferência'),
      content: TextField(
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
            onPressed: () {},
            child: Text('Cancelar'),
        ),
        TextButton(
            onPressed: () {},
            child: Text('Confirmar'),
        )
      ],
    );
  }
}
