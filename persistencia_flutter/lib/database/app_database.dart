import 'package:path/path.dart';
import 'package:persistencia_flutter/models/contato.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
    db.execute('CREATE TABLE contatos('
        'id INTEGER PRIMARY KEY, '
        'nome TEXT, '
        'numero_conta INTEGER)');
    },
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete,
  );
}

Future<int> salvarContato(Contato contato) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> contatoMap = Map();
  contatoMap['nome'] = contato.nome;
  contatoMap['numero_conta'] = contato.numeroConta;
  return db.insert('contatos', contatoMap);
}

Future<List<Contato>> buscarContatos() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> resultado = await db.query('contatos');

  final List<Contato> contatos = [];

  for (Map<String, dynamic> linha in resultado) {
    final Contato contato = Contato(
      linha['id'],
      linha['nome'],
      linha['numero_conta'],
    );
    contatos.add(contato);
  }
  return contatos;
}