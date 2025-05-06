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
    return result.data["data"];
  }

  @override
  Future getExpense() async {
    var result = await _dio.post('/get-expense', data: {"user_id": 1});
    return result.data["data"];
  }

  @override
  Future insertExpense(ExpenseDTO value) async {
    try {
      var result = await _dio.post('/register-expense', data: value.toJSON());

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
