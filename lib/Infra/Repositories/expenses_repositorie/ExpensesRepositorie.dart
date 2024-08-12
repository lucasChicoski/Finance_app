import 'package:scaffold_project/Domain/DTO/ExpenseDTO.dart';
import 'package:scaffold_project/Infra/Repositories/expenses_repositorie/IExpensesRepository.dart';
import 'package:sqflite/sqflite.dart';

class ExpensesRepositorie implements IExpensesRepository {
  late Database _database;

  ExpensesRepositorie(Database database) {
    _database = database;
  }

  @override
  Future deleteExpense(String hash) {
    var result = _database.rawDelete('DELETE FROM despesas WHERE hash = "$hash";');
    return result;
  }

  @override
  Future getExpense() async {
    var result = await _database.rawQuery('SELECT * FROM despesas WHERE id_usuario = 1 ORDER BY date DESC');
    return result;
  }

  @override
  Future insertExpense(ExpenseDTO value) async {
    try {
      _database.transaction((db) async {
        db.rawInsert("""
            INSERT INTO despesas(
              id_usuario,
              tipo_despesa,
              descricao_despesa,
              valor_gasto,
              prestacoes,
              parcela,
              month,
              hash,
              date,
              is_divided)
             VALUES(
             1, 
             "${value.tipoDespesa}", 
             "${value.descricaoDespesa}", 
             ${value.valorGasto}, 
             ${value.prestacoes}, 
             ${value.parcela}, 
             ${value.month}, 
             "${value.hash}",
             "${value.date}",
             "${value.isDivided}")
             """);
      });

      List<Map> list = await _database
          .rawQuery('SELECT * FROM despesas WHERE hash = "${value.hash}"');

      return list.first;
    } catch (e) {
      throw Error();
    }
  }

  @override
  Future updateExpense(ExpenseDTO value) {
    // TODO: implement updateExpense
    throw UnimplementedError();
  }
}
