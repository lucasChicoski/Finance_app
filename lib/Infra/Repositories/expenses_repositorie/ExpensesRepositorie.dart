import 'package:dio/dio.dart';
import 'package:scaffold_project/Domain/DTO/expense_update_DTO.dart';
import 'package:scaffold_project/Domain/DTO/expense_v2.dart';
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
    return result.data["data"];
  }

  @override
  Future getExpense(int id) async {
    var result = await _dio.post('/get-expense', data: {"user_id": id});
    return result.data["data"];
  }

  @override
  Future insertExpense(Expensev2DTO value) async {
    try {
      var result = await _dio.post('/register-expense', data: value.toJson());

      return result.data['data'];
    } catch (e) {
      throw Error();
    }
  }

  @override
  Future updateExpense(ExpenseUpdateDTO value) {
    try {
      var result = _dio.post('/update-expense', data: value.toJson());
      return result.then((response) => response.data['data']);
    } catch (e) {
      throw Error();
    }
  }
}
