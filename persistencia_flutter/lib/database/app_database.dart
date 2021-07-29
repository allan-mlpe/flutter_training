import 'package:path/path.dart';
import 'package:persistencia_flutter/database/dao/contato_dao.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContatoDao.SQL_CRIACAO_TABELA);
    },
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete,
  );
}
