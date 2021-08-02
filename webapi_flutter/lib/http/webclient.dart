import 'dart:convert';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:http/http.dart';
import 'package:webapi_flutter/models/contato.dart';
import 'package:webapi_flutter/models/transferencia.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print(data.toString());
    print("======================= REQUEST =======================");
    print('URL: ${data.url}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print(data.toString());
    print("======================= RESPONSE =======================");
    print('status: ${data.statusCode}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }

}

final Uri BASE_URI = Uri.parse('http://192.168.0.19:8080/transactions');

Future<List<Transferencia>> buscarTransferencias() async {
  Client client = InterceptedClient.build(interceptors: [
    LoggingInterceptor(),
  ]);

  var response =
    await client.get(BASE_URI)
        .timeout(Duration(seconds: 5)); // adiciona timeout de 5s

  final List<dynamic> decodeJson = jsonDecode(response.body);
  final List<Transferencia> transferencias = [];

  // iteramos sobre a lista de JSON para fazer as conversões dos objetos
  for(Map<String, dynamic> transferenciaJson in decodeJson) {
    Transferencia transferencia =
      converterMapaParaTransferencia(transferenciaJson);

    transferencias.add(transferencia);
  }

  return transferencias;
}

Transferencia converterMapaParaTransferencia(Map<String, dynamic> transferenciaJson) {
  final Map<String, dynamic> contatoJson = transferenciaJson['contact'];
  final Contato contato = Contato(
    0,
    contatoJson['name'],
    contatoJson['accountNumber']
  );

  final Transferencia transferencia = Transferencia(
    transferenciaJson['value'],
    contato
  );
  return transferencia;
}

Future<Transferencia> salvarTransferencia(Transferencia transferencia) async {
  var client = InterceptedClient.build(interceptors: [
    LoggingInterceptor()
  ]);

  final Map<String, dynamic> transferenciaMap = {
    'value': transferencia.valor,
    'contact': {
      'name': transferencia.contato.nome,
      'accountNumber': transferencia.contato.numeroConta
    }
  };

  final String payloadJson = jsonEncode(transferenciaMap);

  final Response response = await client.post(BASE_URI,
    headers: {
      'Content-type': 'application/json',
      'password': '1000',
    },
    body: payloadJson
  );

  final Map<String, dynamic> mapaResposta = jsonDecode(response.body);

  return converterMapaParaTransferencia(mapaResposta);
}