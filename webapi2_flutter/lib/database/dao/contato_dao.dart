import 'package:webapi2_flutter/database/app_database.dart';
import 'package:webapi2_flutter/models/contato.dart';
import 'package:sqflite/sqflite.dart';

class ContatoDao {

  static const String SQL_CRIACAO_TABELA = 'CREATE TABLE contatos('
      'id INTEGER PRIMARY KEY, '
      'nome TEXT, '
      'numero_conta INTEGER)';

  static const String _NOME_TABELA = 'contatos';
  static const String _COLUNA_ID = 'id';
  static const String _COLUNA_NOME = 'nome';
  static const String _COLUNA_NUMERO_CONTA = 'numero_conta';

  Future<int> salvarContato(Contato contato) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> contatoMap = Map();
    contatoMap[_COLUNA_NOME] = contato.nome;
    contatoMap[_COLUNA_NUMERO_CONTA] = contato.numeroConta;
    return db.insert(_NOME_TABELA, contatoMap);
  }

  Future<List<Contato>> buscarContatos() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> resultado = await db.query(_NOME_TABELA);

    final List<Contato> contatos = [];

    for (Map<String, dynamic> linha in resultado) {
      final Contato contato = Contato(
        linha[_COLUNA_ID],
        linha[_COLUNA_NOME],
        linha[_COLUNA_NUMERO_CONTA],
      );
      contatos.add(contato);
    }
    return contatos;
  }
}