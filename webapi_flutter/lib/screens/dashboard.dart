import 'package:flutter/material.dart';
import 'package:webapi_flutter/screens/lista_contatos.dart';

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
            Row(
              children: [
                _FeatureCard('Transferências', Icons.monetization_on),
                _FeatureCard('Feed', Icons.description)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {

  final String tituloCard;
  final IconData icone;

  const _FeatureCard(this.tituloCard, this.icone);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ListaContatos())
            );
          },
          child: Container(
            height: 100,
            width: 150,
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icone,
                  color: Colors.white,
                  size: 24.0,
                ),
                Text(
                  tituloCard,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}