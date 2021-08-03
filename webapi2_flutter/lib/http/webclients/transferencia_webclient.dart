import 'dart:convert';

import 'package:http/http.dart';

import 'package:webapi2_flutter/http/webclient.dart';
import 'package:webapi2_flutter/models/transferencia.dart';


class TransferenciaWebClient {
  final Uri baseUri = Uri.parse('http://192.168.0.19:8080/transactions');

  Future<List<Transferencia>> buscarTransferencias() async {
    var response = await apiClient.get(baseUri);

    final List<dynamic> decodeJson = jsonDecode(response.body);

    final List<Transferencia> transferencias =
      decodeJson.map((json) => Transferencia.fromJson(json)).toList();

    return transferencias;
  }

  Future<Transferencia> salvarTransferencia(Transferencia transferencia, String senha) async {
    Map<String, dynamic> transferenciaMap = transferencia.toJson();

    final String payloadJson = jsonEncode(transferenciaMap);

    final Response response = await apiClient.post(baseUri,
        headers: {
          'Content-type': 'application/json',
          'password': senha,
        },
        body: payloadJson
    );

    if (response.statusCode == 200) {
      return Transferencia.fromJson(jsonDecode(response.body));
    }

    throw Exception(_mapaErrosHttp[response.statusCode]);
  }

  static final Map<int, String> _mapaErrosHttp = {
    400: 'Dados da trasnferências inválidos.',
    401: 'Senha inválida.',
  };
}