import 'contato.dart';

class Transferencia {
  final String id;
  final double valor;
  final Contato contato;

  Transferencia(
      this.id,
      this.valor,
      this.contato,
      );

  @override
  String toString() {
    return 'Transferencia{valor: $valor, contact: $contato}';
  }

  Transferencia.fromJson(Map<String, dynamic> json) :
      id = json['id'],
      valor = json['value'],
      contato = Contato.fromJson(json['contact']);

  toJson() => {
    'id': id,
    'value': valor,
    'contact': contato.toJson()
  };
}