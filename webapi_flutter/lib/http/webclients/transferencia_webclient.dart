import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'package:webapi_flutter/http/interceptors/logging_interceptor.dart';
import 'package:webapi_flutter/models/transferencia.dart';


class TransferenciaWebClient {
  final Uri BASE_URI = Uri.parse('http://192.168.0.19:8080/transactions');

  Future<List<Transferencia>> buscarTransferencias() async {
    Client client = InterceptedClient.build(interceptors: [
      LoggingInterceptor(),
    ]);

    var response =
    await client.get(BASE_URI)
        .timeout(Duration(seconds: 5)); // adiciona timeout de 5s

    final List<dynamic> decodeJson = jsonDecode(response.body);

    final List<Transferencia> transferencias =
      decodeJson.map((json) => Transferencia.fromJson(json)).toList();

    return transferencias;
  }

  Future<Transferencia> salvarTransferencia(Transferencia transferencia) async {
    var client = InterceptedClient.build(interceptors: [
      LoggingInterceptor()
    ]);

    Map<String, dynamic> transferenciaMap = transferencia.toJson();

    final String payloadJson = jsonEncode(transferenciaMap);

    final Response response = await client.post(BASE_URI,
        headers: {
          'Content-type': 'application/json',
          'password': '1000',
        },
        body: payloadJson
    );

    return Transferencia.fromJson(jsonDecode(response.body));
  }
}