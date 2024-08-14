import 'package:scaffold_project/Domain/DTO/ExpenseInstallmentDTO.dart';
import 'package:scaffold_project/Global/dio_instance.dart';
import 'package:scaffold_project/Infra/Repositories/expense_installments/IExpenses_installments_repository.dart';
import 'package:sqflite/sqflite.dart';

class ExpensesInstallmentsRepositories
    implements IExpensesInstallmentsRepository {
  late Database _database;
  ExpensesInstallmentsRepositories(Database database) {
    _database = database;
  }

  @override
  Future deleteExpense(String hash) {
    // TODO: implement deleteExpense
    throw UnimplementedError();
  }

  @override
  Future getExpense() async {
    // TODO: implement getExpense
    return await _database.rawQuery("SELECT * FROM despesas_parceladas");
  }

  @override
  Future insertExpense(ExpenseInstallmentDTO value) async {
    var result = await DioInstance.dio()
        .post('/register-installments-expense', data: value.toJson());

//     await _database.transaction((db) async {
//       await db.rawInsert("""
//          INSERT INTO despesas_parceladas(
//             descricao_despesa,
//             valor_gasto,
//             prestacoes,
//             parcela
//          ) VALUES (
//             "${value.descricaoDespesa}",
//             ${value.valorGasto},
//             ${value.prestacoes},
//             ${value.qParcela}
//          )
//  """);
//     });

//     //trazer apenas o item adicionado.
//     return await _database.rawQuery("SELECT * FROM despesas_parceladas");

    return result.data['data'];
  }

  @override
  Future updateExpense(ExpenseInstallmentDTO value) {
    // TODO: implement updateExpense
    throw UnimplementedError();
  }
}
