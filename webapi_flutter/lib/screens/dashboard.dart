import 'package:flutter/material.dart';
import 'package:webapi_flutter/screens/lista_contatos.dart';
import 'package:webapi_flutter/screens/lista_transferencia.dart';

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
                _FeatureCard(
                  'Transferências',
                  Icons.monetization_on,
                  onClick: () => _navegarParaListaContatos(context),
                ),
                _FeatureCard(
                  'Feed', 
                  Icons.description, 
                  onClick: () => _navegarParaListaTransferencias(context),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _navegarParaListaContatos(BuildContext context) {
    _navegarParaWidget(context, ListaContatos());
  }

  _navegarParaListaTransferencias(BuildContext context) {
    _navegarParaWidget(context, ListaTransferencia());
  }

  _navegarParaWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => widget)
    );
  }
}

class _FeatureCard extends StatelessWidget {

  final String tituloCard;
  final IconData icone;
  final Function onClick;

  const _FeatureCard(this.tituloCard, this.icone, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onClick(),
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