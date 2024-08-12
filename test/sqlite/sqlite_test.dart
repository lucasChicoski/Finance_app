import 'dart:io';

import 'package:scaffold_project/Infra/DataBase/SqFlite/sqflite.dart';
import 'package:test/test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

final database = SQFlite();

defineDeviceToDB() {
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    // Initialize FFI
    sqfliteFfiInit();
  }
  databaseFactory = databaseFactoryFfi;
}

void main() {
  test('Get Path Database ', () async {
    //Condicional apenas para dispositivos que não for android e Ios
    defineDeviceToDB();
    await database.geLocationDataBase();
  });

  test("OpenDataBase", () async {
    defineDeviceToDB();
    await database.geLocationDataBase();

    try {
      await database.openDataBase(database.pathDatabase);
    } catch (e) {
      print('banco não inicializado' + database.pathDatabase);
    }
  });

  test("Delete database", () async {
    defineDeviceToDB();
    await database.geLocationDataBase();
    try {
      await database.openDataBase(database.pathDatabase);
      await database.deleteDataBase(database.pathDatabase);
    } catch (e) {
      print('Erro Banco');
    }
  });

  test('GetRecords', () async {
    defineDeviceToDB();
    await database.geLocationDataBase();
    Database db = await database.openDataBase(database.pathDatabase);
    try {
      List<Map> list = await db.rawQuery(
          'SELECT * FROM usuario');
      print(list);
    } catch (e) {
      print("Erro");
    }
  });

  test("Insert Records", () async {
    defineDeviceToDB();
    await database.geLocationDataBase();

    try {
      Database db = await database.openDataBase(database.pathDatabase);
      db.transaction((tx) async {
        tx.rawInsert(
            'INSERT INTO usuario(nome, sobrenome, email, data_nascimento, telefone) VALUES("Lucas", "Chicoski", "lucas.chicoski9@gmail.com", "23/11/1996", "27981092836")');
      });
      db.transaction((tx) async {
        tx.rawInsert(
            'INSERT INTO usuario(nome, sobrenome, email, data_nascimento, telefone) VALUES("Brenda", "Chicoski", "brenda.chicoski9@gmail.com", "23/01/1996", "27981092836")');
      });
      db.transaction((tx) async {
        tx.rawInsert(
            'INSERT INTO configuracao_financeiro(id_usuario, renda, guarde_dinheiro) VALUES(1, "4500", "1000")');
      });

      // List<Map> list =
      //     await db.rawQuery('SELECT * FROM usuario');
      List<Map> list = await db.rawQuery(
          'SELECT * FROM configuracao_financeiro WHERE id_usuario = 1');
      // List<Map> list =
      //     await db.rawQuery('SELECT * FROM usuario WHERE nome like "Lucas"');
      print(list);

      database.deleteDataBase(database.pathDatabase);
    } catch (e) {
      print('Erro Banco');
    }
  });
}
