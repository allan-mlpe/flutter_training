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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(textoLoading),
          )
        ],
      ),
    );
  }
}
