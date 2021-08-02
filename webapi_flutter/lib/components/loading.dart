import 'package:flutter/material.dart';

class Loading extends StatelessWidget {

  final String textoLoading;

  const Loading({this.textoLoading = 'Carregando...'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text(textoLoading)
        ],
      ),
    );
  }
}
