import 'package:flutter/material.dart';
import 'package:persistencia_flutter/screens/lista_contatos.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bytebank'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset('images/bytebank_logo.png'),
            Material(
              color: Theme.of(context).primaryColor,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ListaContatos())
                  );
                },
                child: Container(
                  // quando usamos o inkwell não podemos definir a cor
                  // dos filhos, caso contrário o efeito não será aplicado
                  //color: Theme.of(context).primaryColor,
                  height: 100,
                  width: 150,
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      Text(
                        'Contatos',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}