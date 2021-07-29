import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:persistencia_flutter/models/contato.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> criarBancoDeDados(){
  // `getDatabasePath` retorna um Future, por isso usamos o `then`
  return getDatabasesPath().then((dbPath){
    final String path = join(dbPath, 'bytebank.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE contatos('
          'id INTEGER PRIMARY KEY, '
          'nome TEXT, '
          'numero_conta INTEGER)');
    }, version: 1);
  });
}

Future<int> salvarContato(Contato contato) {
  return criarBancoDeDados().then((db) {
    final Map<String, dynamic> contatoMap = Map();
    contatoMap['nome'] = contato.nome;
    contatoMap['numero_conta'] = contato.numeroConta;
    return db.insert('contatos', contatoMap);
  });
}

Future<List<Contato>> buscarContatos() {
  return criarBancoDeDados().then((db) {
    return db.query('contatos').then((maps) {
      final List<Contato> contatos = [];
      for (Map<String, dynamic> map in maps) {
        debugPrint(map.toString());
        final Contato contato = Contato(
          map['id'],
          map['nome'],
          map['numero_conta'],
        );
        contatos.add(contato);
      }
      return contatos;
    });
  });
}