import 'package:sqflite/sqflite.dart';

abstract class ISqflite {
  Future<Database> openDataBase(String path);
  Future<String> geLocationDataBase();
  Future<void> deleteDataBase(String path);
  Future<int> insertRecord(); //Não precisa
  Future<int> updateRecord(); //Não precisa
  Future<List<Map>> getRecords();
  Future<int> countRecords();
  Future<int> deleteRecord(); //Não precisa
  Future<void> closeDatabase();
}
