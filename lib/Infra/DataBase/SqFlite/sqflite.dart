import 'package:scaffold_project/Infra/DataBase/SqFlite/i_sqflite.dart';
import 'package:sqflite/sqflite.dart';

class SQFlite implements ISqflite {
  late Database _database;
  String pathDatabase = '';

  Database getDataBase() {
    return _database;
  }

  @override
  Future<void> closeDatabase() {
    // TODO: implement closeDatabase
    throw UnimplementedError();
  }

  @override
  Future<int> countRecords() {
    // TODO: implement countRecords
    throw UnimplementedError();
  }

  @override
  Future<void> deleteDataBase(String path) async {
    await deleteDatabase(path);
  }

  @override
  Future<int> deleteRecord() {
    // TODO: implement deleteRecord
    throw UnimplementedError();
  }

  @override
  Future<String> geLocationDataBase() async {
    var databasesPath = await getDatabasesPath();
    String path = '$databasesPath/teste.db';
    pathDatabase = path;
    return pathDatabase;
  }

  @override
  Future<List<Map>> getRecords() {
    // TODO: implement getRecords
    throw UnimplementedError();
  }

  @override
  Future<int> insertRecord() {
    // TODO: implement insertRecord
    throw UnimplementedError();
  }

  @override
  Future<Database> openDataBase(String path) async {
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute("""
          CREATE TABLE usuario (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            sobrenome TEXT,
            email TEXT,
            data_nascimento TEXT,
            telefone TEXT
          )
        """);

        await db.execute("""
          CREATE TABLE configuracao_financeiro (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            id_usuario INTEGER,
            renda REAL,
            guarde_dinheiro REAL,
            balance REAL,
            FOREIGN KEY (id_usuario) REFERENCES usuario(id)
          )
         """);

        await db.execute("""
            CREATE TABLE despesas (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              id_usuario INTEGER,
              tipo_despesa TEXT,
              descricao_despesa TEXT,
              valor_gasto REAL,
              prestacoes REAL,
              parcela INTEGER,
              month INTEGER,
              hash TEXT,
              date NUMERIC,
              is_divided NUMERIC,
              id_despesa_parcelada INTEGER,
              FOREIGN KEY (id_usuario) REFERENCES usuario(id)
              FOREIGN KEY (id_despesa_parcelada) REFERENCES despesas_parceladas(id)
            )
         """);

        await db.execute("""
          CREATE TABLE despesas_parceladas (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            descricao_despesa TEXT,
            valor_gasto REAL,
            prestacoes REAL,
            parcela INTEGER
          )
        """);

        await db.rawInsert(
          'INSERT INTO usuario(nome, sobrenome, email, data_nascimento, telefone) VALUES("", "", "", "", "")',
        );

        await db.rawInsert(
          'INSERT INTO configuracao_financeiro(id_usuario, renda, guarde_dinheiro, balance) VALUES(1, 0, 0, 0)',
        );
      },
    );
    Database db = _database;
    return db;
  }

  @override
  Future<int> updateRecord() {
    // TODO: implement updateRecord
    throw UnimplementedError();
  }
}
