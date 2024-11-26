import 'package:dio/dio.dart';
import 'package:scaffold_project/Domain/DTO/ExpenseDTO.dart';
import 'package:scaffold_project/Infra/Repositories/expenses_repositorie/IExpensesRepository.dart';


class ExpensesRepositorie implements IExpensesRepository {
  late Dio _dio;

  ExpensesRepositorie(Dio dio) {
    _dio = dio;
  }

  @override
  Future deleteExpense(String hash) async {
    var result =
        await _dio.post('/delete-expense', data: {"hash_expense": hash});

    // var result =
    //     _database.rawDelete('DELETE FROM despesas WHERE hash = "$hash";');
    return result.data["data"];
  }

  @override
  Future getExpense() async {
    var result = await _dio.post('/get-expense', data: {"user_id": 1});

    // var result = await _database.rawQuery(
    //     'SELECT * FROM despesas WHERE id_usuario = 1 ORDER BY date DESC');
    return result.data["data"];
  }

  @override
  Future insertExpense(ExpenseDTO value) async {
    try {
      var result = await _dio.post('/register-expense', data: value.toJSON());

      // _database.transaction((db) async {
      //   db.rawInsert("""
      //       INSERT INTO despesas(
      //         id_usuario,
      //         tipo_despesa,
      //         descricao_despesa,
      //         valor_gasto,
      //         prestacoes,
      //         parcela,
      //         month,
      //         hash,
      //         date,
      //         is_divided)
      //        VALUES(
      //        1,
      //        "${value.tipoDespesa}",
      //        "${value.descricaoDespesa}",
      //        ${value.valorGasto},
      //        ${value.prestacoes},
      //        ${value.parcela},
      //        ${value.month},
      //        "${value.hash}",
      //        "${value.date}",
      //        "${value.isDivided}")
      //        """);
      // });

      // return list.first;
      return result.data;
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
